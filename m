Return-Path: <linux-gpio+bounces-2628-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6999C83DE2A
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 16:59:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D1C31C221F3
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 15:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6081D697;
	Fri, 26 Jan 2024 15:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qt.log.osaka header.i=@qt.log.osaka header.b="kQoEC5YJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from qt.log.osaka (qt.log.osaka [188.166.224.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA101D524
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jan 2024 15:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.224.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706284728; cv=none; b=pAx2HYUDkcSA0Frjo9Z6JJZjfXiQegE7ehuncDWFEYlJK6USciyvdHLRLvoBfKGXop38WrwEJ6vYT0OfToFDPQaViIkFXGmeV1Nn9TKl0gD9oN+HLCWyE17hAXLXSalwHlC8klctm94M/+7sOsTUhhfUJpTAuJHotVPhmPFWeR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706284728; c=relaxed/simple;
	bh=c1JzX9aBWrUqYVeIvPG+eFrgtObO4ZBdVLVcn0dQtns=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=kHysgNK+K03YTl8hx4Rd8Nyjp9XyILC4dZ4X4xkmLmeuvEBiLxZ3FETYbyZIFS6DPqqr4HYrlGfjmtORY2MHRTSL9UzbdhYe7SqPezPClkVCtnKw0zTdhQu5uCqNIj8eDi7LmJgS6JeCjFdq3d2uapyl8cHHYnYXxGIEOrV1BPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aha.ne.jp; spf=pass smtp.mailfrom=aha.ne.jp; dkim=pass (1024-bit key) header.d=qt.log.osaka header.i=@qt.log.osaka header.b=kQoEC5YJ; arc=none smtp.client-ip=188.166.224.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aha.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aha.ne.jp
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=qt.log.osaka; h=date:to
	:from:subject:message-id:mime-version:content-type
	:content-transfer-encoding; s=dkim1; bh=h3PqtSbRDmtMmAm6Un0+xfhK
	fd4=; b=kQoEC5YJFPCDacyIWbV2CWQ51IljssBOKTXZd5Eyf3cxXIYTQF6FbAqP
	e9ze/q3/ilNBoJIpBJ9gdHRI7FOnOpKDZ7dnnqMCVR+GX7q7yTsW/VvzdI5KqbuQ
	/elFb4uRisqlZGwhyQTB6FzkRJsKiyk25sPgbpwiMq/YTXnaI+U=
Received: (qmail 9409 invoked by uid 89); 26 Jan 2024 15:52:00 -0000
X-DKIM-Originator: info@aha.ne.jp
X-DKIM-Policy-Detail: dk_sender=neutral; dkim_author=neutral;
  dkim_ADSP=neutral
Authentication-Results: qt.log.osaka ; domainkeys=none; dkim=none;
  auth=pass smtp.auth=postmaster@log.osaka
Received: from unknown (HELO aha.ne.jp) (postmaster@log.osaka@52.139.171.19)
  by qt.log.osaka with ESMTPA; 26 Jan 2024 15:52:00 -0000
Date: Fri, 26 Jan 2024 15:51:59 +0000
To: linux-gpio@vger.kernel.org
From: AHA! <info@aha.ne.jp>
Subject: =?UTF-8?B?44GK5ZWP44GE5ZCI44KP44Gb44GC44KK44GM44Go44GG44GU44GW44GE44G+?=
 =?UTF-8?B?44GX44Gf44CC77y7QUhBIe+8vQ==?=
Message-ID: <oMGWpqPqWzAsjkgWcs6xip8UoqpYKiIqXal1bj9vc@aha.ne.jp>
X-Mailer: WPMailSMTP/Mailer/smtp 3.2.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

mymnsuicy さま

この度は、お問い合わせを頂き誠にありがとうございました。
あらためて担当者よりご連絡をさせていただきます。

---

件名：
Rebuilding Our Connection

メッセージ:
My heart is a library filled with stories of us. 
In case you can spare a moment, could you please visit my page using this link: https://tinyurl.com/ynab7xo6 I've uploaded some recent photos and updates from the latest events there. It would be fantastic to catch up and share our experiences.


