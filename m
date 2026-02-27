Return-Path: <linux-gpio+bounces-32325-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC0iNFDMoWnbwQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32325-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 17:54:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D805F1BB0F2
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 17:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3A1831AE990
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 16:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04953469FA;
	Fri, 27 Feb 2026 16:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SagKPqZu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C169134B426
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 16:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772210966; cv=none; b=TixWMjiOizs+4Bk677eRchfu5w+h9Wkna1HpxIBFIEe2muO2jLyxQl671jCiaOE/xO63zjV27uqGkeYD71BL3Bd8cw33Q8emFWTtyrL5iGdnhLISc1WPrgL5yXmUUjAuVRB1wqVodDkVT9ooCAE0pgQm8qOBdVTO6hTpWeisjFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772210966; c=relaxed/simple;
	bh=nB8ACLDa/maVuyIonK23zA1TMYBPWmnsl35nExKZrIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yv5FPnr07PbsUEZq44RQ0dGuR+V2U65oM1XbDc72iXPs4I1h3ATL+XrO+J+1neW9tlAc1WZjdhS9fT7H0JrZtbbToxIZftZ0BRkkCEpdCgDwX+cTjw64Uc5640KTTowHff/PjoasX3xcNG8e4kYUZpOPavIJT6xRrlddelaNOUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SagKPqZu; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439857ec679so2036282f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 08:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772210962; x=1772815762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A/LFLpePUhhqI6yxDTeIBKOmLDg2carPPgsWLX2flrE=;
        b=SagKPqZubvBDHUYFEMOj7i7pjfNhH41oZVonz8ads3sSXyWZnaawT4Mhnf3wEODavU
         Xuclizf5i7E2fPlJBAq94Ao7Fr3KsmOnNvsW095PfCirv2vG7ovYpThmzQpx7aNJhdHG
         W73N0OvGeTYmv2huRd/pT1fdwXCwLIOraDg1JaIKAUUAZ3zBSPCwYPT0hVY1wkXHays0
         1zwkKe/BEEcJkopB/9kLR3oI4era8NdO5sY6tzZcrdcdqM7k02E+rOyuIj+dEMzEIguP
         goRjB2T3ZIHYPaBnhfceTzY/elA5NC68Nzs8dizat8QHwXWks6mkcoYzJ2gyZYTFMreM
         qw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772210962; x=1772815762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/LFLpePUhhqI6yxDTeIBKOmLDg2carPPgsWLX2flrE=;
        b=GI8XEph8Tt48d2//+zqpll/jQVCNCnaQITJFtSZ599dE6gPIwdAyytvi+DLzy/UBgi
         GmakNnQdcslnbsaJkb/Fc1qwSPoaTUFQQ8MCAVtKP+vU3mHpmsb94XKvfrrAdu6ghLH8
         S9XdPabhDHQ2TPG0HucCEpFXIn5SXvIoqkLI7QXVlPLsohPQqLsDRRZY0KiW2t+Qm5gU
         XTLL3hTk/MWiWoUPi8RC5xytlR8Zr38cqTEOtPOb5qb9QdxWfp7PlYxqGOQoJV8L+w+J
         CKInJl80BNWa1dI8HX6yagpV0+y6mjGIoQ1VXq+pALD6mRHi2TmhBIMjYnEhhd1zQve/
         KfFA==
X-Forwarded-Encrypted: i=1; AJvYcCUAO+CtO8KF06Femgd1qnbYcmxt+ZweiwqbEZlcZ5nswLRU12iJsYCffOcJRplc+posOzQrhojwlP0X@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx/r7q4zVEvccakPIGyQQeLqoGHOVRfwpOdV19xudtbUPHxQye
	URIcW8ZC8zZffmwOfqS6MdgmeBMqQpNYQ8fPJVQsOThKHOqyjDLvnc9MW49Te6hdcj4=
X-Gm-Gg: ATEYQzwAnzWG9RtK8fHiZI1+grLEgbfCdu2Q8RcAcVaOl3GwxQtJeeZouO3kF4ZAgJq
	zmUr048F70SH5MQ7t18h6rzZ4xVt+YrdplACsdi6t0UHZxK5gZlBq99/HbUfNPU3WFj1oT9MW9t
	tcjnKO8I5a17Et/uLT1wlDBvTHYyRevoZ2QGKpTOCdTa3l0hlDL+bSYDcvRDtJdQA3pkgFBSM1t
	hs5QZ10rtBcbVqQgwZaAmsrwHgke/JNWsi8XhKjcaBzMh0Us9GFZNd119COJHrj+eNqKraQh/ox
	8g4UJONs7lFjumaOldj4NK2ykA96ll2tEgcPt8neS8ZVN3quZ7xCayFPVQNjvbxAcLXHI4LaF4E
	dZJqsB7cnCQpTa49enre/jO3gmGQPnoN6qKfd9+uJ6NPDK6d7v6ytS0IA9f5LaJ46V4gTWV+3IO
	oWRyOBZkdBbyNr0ev1Bkrv0QaqaMOQ
X-Received: by 2002:a05:6000:1a8b:b0:436:34e8:e661 with SMTP id ffacd0b85a97d-4399de279aemr5867410f8f.31.1772210962058;
        Fri, 27 Feb 2026 08:49:22 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60f8e5sm8838998f8f.4.2026.02.27.08.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 08:49:21 -0800 (PST)
Date: Fri, 27 Feb 2026 19:49:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [linusw-pinctrl:devel 16/22]
 drivers/pinctrl/pinctrl-cy8c95x0.c:1325 cy8c95x0_irq_setup() warn: passing
 positive error code '1' to 'dev_err_probe'
Message-ID: <aaHLDnSHe--dR_63@stanley.mountain>
References: <202602271847.vVWkqLBD-lkp@intel.com>
 <aaGzzsLMeW2DTjiE@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaGzzsLMeW2DTjiE@ashevche-desk.local>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32325-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D805F1BB0F2
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 05:10:06PM +0200, Andy Shevchenko wrote:
> On Fri, Feb 27, 2026 at 02:40:45PM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
> > head:   a901e8705f89f3616fad3bb6aeddba33be86b08a
> > commit: 014884732095b982412d13d3220c3fe8483b9b3e [16/22] pinctrl: cy8c95x0: Unify messages with help of dev_err_probe()
> 
> False positive. This commit didn't change the previous behaviour. Perhaps
> smatch complained earlier?

Smatch only detected it when we changed to dev_err_probe().  We could
make a check to detect the bug in the original code I suppose.  Let
me add it as a todo.

KTODO: create static checker rule about positive returns from probe()

Description:  The cy8c95x0_irq_setup() is called from cy8c95x0_probe()
and probe() should only return zero or negative error codes.  Make a
list of positive returns.  Then check if this is a probe() function and
we're returning a positive.  Ask on the smatch@vger.kernel.org mailing
list if you want help writing this check.

regards,
dan carpenter


