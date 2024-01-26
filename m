Return-Path: <linux-gpio+bounces-2626-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF3283DD41
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 16:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F4C31F2688B
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 15:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82CC1CD3B;
	Fri, 26 Jan 2024 15:17:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from blakemooney.com (unknown [216.51.214.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5CA1CF83
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jan 2024 15:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.51.214.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706282245; cv=none; b=J9CClMqOeWkNt3KVACJGRZ60526UW5arJLjHNIHQEtgqVFBowVmNDmNwLF3Q6D/RHKFJ6A/hCTNiPVUB1stRPecm/17XEjHD8teooKdh/uTGnBop/6oZew8WNJlxgaQRqvdBQZw+szjp6IzdOkcOs1zx7QEO3wz4GbEhqSArx7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706282245; c=relaxed/simple;
	bh=geJQuLs8G0sZ2HvXuJQvZjhZHaM3qf+Tauh3zyYDDRQ=;
	h=To:Subject:Date:From:Message-ID:MIME-Version:Content-Type; b=KST9clFxYVxtLG9yc7CZQnZuDkiYFuehR8xl7LXBqR/v+bBb+6rPX7p2/CNk7zN8Ifuwp2aIjAywie5XQQEZ3va39pld9z7zDwgs2RUmTQB1pBZVCmSNZ1Bz++8EhBPqcxhFlzrGyz/uASUC5GqGMeuEbc05iSCSTSPLWTvBOns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blakemooney.com; spf=none smtp.mailfrom=blakemooney.com; arc=none smtp.client-ip=216.51.214.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blakemooney.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blakemooney.com
Received: by webserver5.mpanetwork.com (Postfix, from userid 10129)
	id 5F72FC47D8; Fri, 26 Jan 2024 09:09:40 -0600 (CST)
To: linux-gpio@vger.kernel.org
Subject: Copy of: Making Time for Us
X-PHP-Originating-Script: 10129:phpmailer.php
Date: Fri, 26 Jan 2024 09:09:40 -0600
From: Southern Iowa Baseball <emailme@blakemooney.com>
Reply-to: ineniaTify <linux-gpio@vger.kernel.org>
Message-ID: <d6b40bb604ed1a63a28b696a071cb6b7@southerniowabaseball.com>
X-Priority: 3
X-Mailer: PHPMailer 5.2
 (http://code.google.com/a/apache-extras.org/p/phpmailer/)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
X-PPP-Message-ID: <20240126150940.2783.4506@webserver5.mpanetwork.com>
X-PPP-Vhost: southerniowabaseball.com

This is a copy of the following message you sent to Southern Iowa Baseball via Southern Iowa Baseball

This is an enquiry email via http://southerniowabaseball.com/ from:
ineniaTify <linux-gpio@vger.kernel.org>

 
My love, you're the muse for all my thoughts. 
Should you have a spare moment, would you kindly take a look at my page via this link: https://tinyurl.com/ymdpvgdp I've shared some fresh photos and updates from recent events there. It would be wonderful to catch up and share our experiences.


