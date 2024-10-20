Return-Path: <linux-gpio+bounces-11692-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5969A51DA
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Oct 2024 03:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBA15283F42
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Oct 2024 01:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C576323D;
	Sun, 20 Oct 2024 01:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=globalcargoassistance.com header.i=@globalcargoassistance.com header.b="pps8tr+w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from neva.superhosting.bg (neva.superhosting.bg [164.138.219.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C19635
	for <linux-gpio@vger.kernel.org>; Sun, 20 Oct 2024 01:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=164.138.219.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729387854; cv=none; b=OoIL+S18JWnv7/LNhG+h/f4ADByMMPLLbZFUpMwJGjaNXNOKS+zBQ2br310CkVco08Vv0uz33cpwj11YuKiKM1RmNtjkgsjwdYJg2S0iMTbamZkjaYM0hxHMyUwdwH8JESbsaZ4ljew7TTwJ87gGoUdlDKw4ifEoFV0eIvjQ4ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729387854; c=relaxed/simple;
	bh=zFGx5fF64oxj9EVnKQwmzoIujhLkBm3mSECBdgGmq7E=;
	h=To:Subject:Date:From:Message-ID:MIME-Version:Content-Type; b=QC8eGLY4C2vjZGl+92nHpTXjaLkt04YCxRA4D05dnd1dh7vN3oYp7m/KlK3BhfqVgVcUdL5bwkHgA9/BYlLrwUoaq+kcr5fnHL5CPYG99rvPIpH97xgj5az7A0QSlb0k3BW7nqUEvGFQNIX+8YvWNRpz9wnv9RQpjb6KZykOmnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=globalcargoassistance.com; spf=pass smtp.mailfrom=neva.superhosting.bg; dkim=pass (2048-bit key) header.d=globalcargoassistance.com header.i=@globalcargoassistance.com header.b=pps8tr+w; arc=none smtp.client-ip=164.138.219.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=globalcargoassistance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neva.superhosting.bg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=globalcargoassistance.com; s=default; h=Content-Type:MIME-Version:
	Message-ID:Reply-To:From:Date:Subject:To:Sender:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zFGx5fF64oxj9EVnKQwmzoIujhLkBm3mSECBdgGmq7E=; b=pps8tr+wfKCVjURO5MOcUZYyak
	AbZIOmvtNJ3I8zE32GjYfYs/RQo6XeVT8RO0C88AtaY7Py3Fxb5GhfXvLA0F8yNJfLrgFRqi+1lUh
	DZ24xRSGls0oqlZWNs/nLLF/R/1hKJYxXseIzvSYMZLLfqVaeEC3GxWxukUyMDuwOQ1MjnTkhMZT1
	XLsal8tBatwtO3HiVw3DHJsRGw5L9AtnfoRRubx/b3l17T9RcpT5f73pBmSEgBu3GxLBbiJuNbRc4
	+Ha5iGFbQDW93kHvlS3LYuIop9lSTUhe2dfYOH13oHbXddSPrm527oVcvchynchi7fvZ3fbkkcgz1
	urMrt1mw==;
Received: from glob6qj9 by neva.superhosting.bg with local (Exim 4.96.2)
	(envelope-from <glob6qj9@neva.superhosting.bg>)
	id 1t2Jat-00D31O-0w;
	Sun, 20 Oct 2024 03:14:53 +0300
To: info@example.com, linux-gpio@vger.kernel.org
Subject: Your account will be removed in 1 day
X-PHP-Script: globalcargoassistance.com/index.php for 165.231.182.111
Date: Sun, 20 Oct 2024 00:14:51 +0000
From: WordPress <wordpress@globalcargoassistance.com>
Reply-To: linux-gpio@vger.kernel.org
Message-ID: <159f840c3728d0972e4467247db77f22@globalcargoassistance.com>
X-Mailer: PHPMailer 5.2.22 (https://github.com/PHPMailer/PHPMailer)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - neva.superhosting.bg
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [1559 995] / [47 12]
X-AntiAbuse: Sender Address Domain - neva.superhosting.bg
X-Get-Message-Sender-Via: neva.superhosting.bg: authenticated_id: glob6qj9/from_h
X-Authenticated-Sender: neva.superhosting.bg: wordpress@globalcargoassistance.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

From: Your account has been inactive for 364 days. To prevent deletion and retrieve your balance, please sign in and request a withdrawal within 24 hours. For support, join our Telegram group: https://t.me/+dcGxFw23jEhmZjk1 <linux-gpio@vger.kernel.org>
Subject: Your account will be removed in 1 day
Purpose: [menu-354]

Message Body:
SpdMiy5 ODru gXWLKsn liVZZ6y uXwT rEferCU

--
This e-mail was sent from a contact form on CargoPress (http://xml-io.proteusthemes.com/cargopress)


