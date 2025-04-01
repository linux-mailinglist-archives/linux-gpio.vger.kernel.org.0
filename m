Return-Path: <linux-gpio+bounces-18145-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B31C6A77941
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 13:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B440188E64C
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 11:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A7A1F03E2;
	Tue,  1 Apr 2025 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=spencerjeando.com header.i=@spencerjeando.com header.b="jDov7xS0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from server.spencerjeando.com (server.spencerjeando.com [162.240.218.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E54D1754B
	for <linux-gpio@vger.kernel.org>; Tue,  1 Apr 2025 11:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.218.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743505405; cv=none; b=pPSauDWiGvRvo8Z9uIEOa/Xyct7H0Ikhgh8D6Z7BDlAG3rbNC8BhZn1FCy4JTH5SfCEti0oreyEHrAfnLgs5mg2LASN7iu9QvDbnsd1udBLNAQ4CvF4OuvhLV93JFB+GVhTzBslZHLfeAXoh3uoiggkSEG7+rdNouoYm4uc7F4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743505405; c=relaxed/simple;
	bh=6pMPnXAYCclFFolGvl550DYN+zhhdeCITVmXP9T7QFg=;
	h=To:Subject:Date:From:Message-ID:MIME-Version:Content-Type; b=ji1bdsCpS/78elX5D99nZmYfwl9R2oobZJ687j1TF9CIcK9h+QM5yYzsIoZSUkEv2GNjxg/y/6kx+XO/ZYa8RmiL21MP+qv3Jt7bHdPSW1ZVUTl3rI5E770p6wEbyycpIIrfAueUWCH0moK7qvS/cDRo4OpTnphZoZOM2eb0yaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cccosteopathy.com; spf=none smtp.mailfrom=server.spencerjeando.com; dkim=pass (2048-bit key) header.d=spencerjeando.com header.i=@spencerjeando.com header.b=jDov7xS0; arc=none smtp.client-ip=162.240.218.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cccosteopathy.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=server.spencerjeando.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=spencerjeando.com; s=default; h=Content-Type:MIME-Version:Message-ID:
	Reply-To:From:Date:Subject:To:Sender:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6pMPnXAYCclFFolGvl550DYN+zhhdeCITVmXP9T7QFg=; b=jDov7xS0PjoEhY1rTnyygHNHQK
	4i15Xo02lA/AuiOxJ2WBmqR2k0/LEQvbBOwQUo3G08vxK5LFpo1Mujmqo6I/QOeeXTNgrWoGmsso4
	W2SMVtWmE4bScmqbUqzdn3tonscirsfelgx1j9PiiJmwa2FBB1L+Kz/PL0TSdKh+DzkcMDVpKvo3G
	w2F4+2ZT6NXEyQVf9Ax2JdJXCXPLYfrb4kYloMX7zS8mf79r61SMLbfF8lqjX5niOZYqB/TrAF151
	nJzuq5XOPFzpwhpoT8NeQLtmO2weGrAu2GJPAV84ioiLBFbQL9IADgjWVI2QCwoOuvKx4IJrsWtMk
	C2gAzPSw==;
Received: from spencgh5 by server.spencerjeando.com with local (Exim 4.98.1)
	(envelope-from <spencgh5@server.spencerjeando.com>)
	id 1tzYpW-000000003OZ-3Ass
	for linux-gpio@vger.kernel.org;
	Tue, 01 Apr 2025 04:26:50 -0600
To: linux-gpio@vger.kernel.org
Subject: Your profile will be removed in 1 day
X-PHP-Script: spencerjeando.com/index.php for 165.231.182.61
X-PHP-Originating-Script: 1003:PHPMailer.php
Date: Tue, 1 Apr 2025 10:26:50 +0000
From: ticOwnete <info@cccosteopathy.com>
Reply-To: linux-gpio@vger.kernel.org
Message-ID: <WLzCgYe0cVIJlFC2BYbpaUDZdMBJx7Oa5dztRR6Qc@spencerjeando.com>
X-Mailer: PHPMailer 6.6.5 (https://github.com/PHPMailer/PHPMailer)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.spencerjeando.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [1003 981] / [47 12]
X-AntiAbuse: Sender Address Domain - server.spencerjeando.com
X-Get-Message-Sender-Via: server.spencerjeando.com: authenticated_id: spencgh5/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: server.spencerjeando.com: spencgh5
X-Source: 
X-Source-Args: 
X-Source-Dir: 

From: ticOwnete <linux-gpio@vger.kernel.org>
Subject: Your profile will be removed in 1 day

Message Body:
Your account has been dormant for 364 days. To stop deletion and claim your funds, please access your account and initiate a payout within 24 hours. For help, visit our Telegram group: https://tinyurl.com/26ygecom


