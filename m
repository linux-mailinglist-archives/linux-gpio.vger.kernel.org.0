Return-Path: <linux-gpio+bounces-32738-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHHVBNtorGnPpQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32738-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 19:05:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE7F22D217
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 19:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3BBB3300BC91
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 18:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A89F36AB74;
	Sat,  7 Mar 2026 18:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMiU5CFM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D869836A01F
	for <linux-gpio@vger.kernel.org>; Sat,  7 Mar 2026 18:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772906708; cv=none; b=A8aHJjKoMrChy6uctuhUwYginZzZvu1fhypQHSQnoLQDb8DRbux+u7jhYSCUK08hmW82GSad33fvpasZOmBoPQPyjwT53wnxJopREtHcQcZbrZldCDuHxfS1r5tNaHF3idiaHQcN2A6ioJMZme7RXEXzQoo4uTLkD4VLwgU68k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772906708; c=relaxed/simple;
	bh=f8u9tZ5yXA+289o2fQEx5pV1hn3JxFCX2cBBveXfXT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIzPhk4V0ZTcugLYVWpTA9YJb9CftxKJ9REHS7EzCPxUrj5gdERpD1znOCiFTXAzTOWTltPPrP6S9Gvxe1wFyyYtjPXX3fPoQEi63zxmwn8AWv0/VwIrjKnE5LidNcwMBZ2ppsA2+he2ELmVgNCWLUib+lWg4u49lneiJmckfJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eMiU5CFM; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bdfd129c52so6876870eec.0
        for <linux-gpio@vger.kernel.org>; Sat, 07 Mar 2026 10:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772906707; x=1773511507; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bBEPXxu/ApclYFmmge/TCqJ31Oo4O40W2MKETuIb+jM=;
        b=eMiU5CFMoRFhtzH/Rb3/kqScaCuUKVmzf/6ewP7tH4l7mZvLbQfx/O+sC5GLqxVFji
         7WlNKcUuT0BuqSd4oyhha64TaWDZfJBasMIbgI9Zivoz6v3dan6W4mElrzNlPVwFJigr
         kcI041C3zappScmRHZjPF29mlC9X2/L6f4K5grWju8oLmOjU3WzwX28OCrzHxSFWr7zO
         ec7IFLp5SuRjtozEVedeqjHXgVxSnqNlgtVjQvTUpFcA5eN2GODnnNQQjtSxRvTzoCLC
         2pFYUTD/KO6qgSVskTv0oeMITmoMHGn5W+m06hZDweljdzVQYwl6adijtdS/0G76RtLI
         t/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772906707; x=1773511507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bBEPXxu/ApclYFmmge/TCqJ31Oo4O40W2MKETuIb+jM=;
        b=K2Jj6AixIGyc38pQFoPqJEYGKSmkUtordOLW/kfSfK40BhG2rr8moHJ7v+hswXaGSs
         xnFm2kMdxDySrCfysEjXktq3QX5nQPcOQBQVrLow5RvrgKsA4mdG9Ib2i20vwng3MLX0
         DptOrl2AkEiU1151D1nYuGVfuet1GKAMKQNnN9gvbhAnoRF8gpXrRTrxhX3XJDKnew/y
         oOJ/I4qBE99KGxT9koV1AyTQYL00cvLFoyknLH/+NP2T2S+rVavTPbmUaL9LJ47pcDXW
         wnTcVm1+CxbQZhDPFOmoxWsRmSMXh35ZPCtScp9m6ID7RVPg6TOKlG1fzmKdmKS6Ggpb
         iRRw==
X-Forwarded-Encrypted: i=1; AJvYcCUmDlTa4Q05F8oIQswZAKeP2HANuxsZnC0g6go74K/vmldBHvU/3PEDQ7zc5/zwvvwXB196qya/HGop@vger.kernel.org
X-Gm-Message-State: AOJu0YzDTJCr0h/AwwcW9yx0PL4KOw/iH0fPuWEZGnsQfFlgYzOLNgeA
	wYiMXaINs4h11hDRBdSxl4Mlk6aobsstHUVsmivSOdkGB340obk3+QNqVeID5A==
X-Gm-Gg: ATEYQzypDBQOC4+XPoUy8n66wH/lx8UbbdC1sjxHbHetFy79fGXMhj8yIiNeM4kwabb
	qcaqAd7gLf3YkWPG24KAjK0t4To/lj3oBlOiVHlQCigKqtH2E3aTHRVkpTcU8N9HhAErqhuZSEo
	8zjAFGxbwqXSQb+RjGYVilG0sykSl+4ujPrcLi14XbNM1xwzraTvJ2Xupb1mFmwTq2Simrc2Q3V
	JFlBTlJVNKpBGLLXpTgFK9b0FTaTohoAfJ7hGCOffAznTL4ak2cPsUIpNAzREAoGWHy5CwTqQlf
	XvN80oopLUOzraxRjYGujoTIBFjb6lyUNF3y9Q7PQAjVK7zyBPxAwqH9mXIhs4TJyaK/may5/dF
	akRGnBggfHb0uSowJyHEJ7xgOyqtF29XUqkDVFnyqAVCbpi+A0k3Kjkn2JdtiU3/XJxcVZPERym
	b8ix0c0SgBiDMjvGjhcM/Nt2RWdr2PLf3j
X-Received: by 2002:a05:7300:ed01:b0:2ba:9cfb:2744 with SMTP id 5a478bee46e88-2be4e063ce8mr2023362eec.30.1772906706866;
        Sat, 07 Mar 2026 10:05:06 -0800 (PST)
Received: from google.com ([2601:647:5e00:4acd:6ebb:c69c:ad7e:23c9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948390sm3742223eec.22.2026.03.07.10.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 10:05:06 -0800 (PST)
Date: Sat, 7 Mar 2026 18:05:04 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v3 6/6] iio: adc: ti-ads7950: complete conversion to
 using managed resources
Message-ID: <aaxow6NtBjSYFVTk@google.com>
References: <20260305-ti-ads7950-facelift-v3-0-a23fdd1a079e@gmail.com>
 <20260305-ti-ads7950-facelift-v3-6-a23fdd1a079e@gmail.com>
 <aarGrAtrVbJgxoK8@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aarGrAtrVbJgxoK8@ashevche-desk.local>
X-Rspamd-Queue-Id: 1DE7F22D217
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32738-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.867];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 02:21:00PM +0200, Andy Shevchenko wrote:
> On Thu, Mar 05, 2026 at 11:21:57AM -0800, Dmitry Torokhov wrote:
> > All resources that the driver needs have managed API now. Switch to
> > using them to make code clearer and drop ti_ads7950_remove().
> 
> ...
> 
> > -	mutex_init(&st->slock);
> 
> I missed seeing the + lines WRT the above removal.
> 

Oops, will fix it up.

-- 
Dmitry

