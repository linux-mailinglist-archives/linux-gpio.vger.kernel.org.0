Return-Path: <linux-gpio+bounces-34195-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJVEMBf+xGny5QQAu9opvQ
	(envelope-from <linux-gpio+bounces-34195-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 10:36:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4743326BF
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 10:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C8D89306D700
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 09:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418DD346E75;
	Thu, 26 Mar 2026 09:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xMzSEWc3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1B1346FA6
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 09:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517420; cv=none; b=Rlvu4GtDJDykPjOATBowiTUoe+XUruhUSJdOc//QLtKNgLZ4mF6aQ9S8ALBYuvpdML4UooMFueIEQ9pcCvAU0fZhV5ITDTADKt1PNSprrqBa+yieCJDOlQpYsD9l/0tAU1/gnqMFlQtMtmalJyvK+YdFnBuuPEw+iSYXTm4MIxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517420; c=relaxed/simple;
	bh=76P6MTojWxyS09DUsQY26VIzSMM8yABXimmKyWGPyY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMggd/mqHBmk59VCfC4bUyqDSumt5Dekozp1gg66Fz4AHSTmWQX/ozwBN8HPTvSHRwR8de817QFx2MbSmiI/sH3VbRVeafP0AZP3yGu/SnnjAQ+QNRcZ+kQvP6hCcN7ebeEbVO6oZbqpmFfZ3kUNG9tb7DRrf4GgxMpeGMLUAGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xMzSEWc3; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so7010135e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 02:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774517417; x=1775122217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u/1E3XJVA4/n+ORYtOSJ9uubj2svA1SkWoojEpFcseQ=;
        b=xMzSEWc31iIsmPSEPeul0DUvV+oPgXWbgcmonc8IfjZKZ3NO/IhJfMexFI4O3Woq/i
         Ws6k5w/clkjHyVqnH0bcN9gr+Pq+8vsvxSFcSq1e0v3KRgwBYFVx6XuvMinUc1KuTyGR
         eMNPgFB3Kwfe1un3giuikcZJWs/bs3GqngfuK27L7zd3b+9IirS5tyJPMMnVRfa++R8I
         0/FTddAjvXiB82iadERqkeiWOfT2zbTQ5systiIpXOmmpj0BpjHtmEsgaPgcFgg0Y7OE
         gM1LfF4sXMC6Oo+6Kppu0/x2vdalwEefXC3vRPoe6Ye6XFoZqzAG9MZ4oZ85mm4ufJhm
         cCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517417; x=1775122217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/1E3XJVA4/n+ORYtOSJ9uubj2svA1SkWoojEpFcseQ=;
        b=XSV3HXULqh01CEdAyLqqW8Uo6UJP+rT78UanyFhLrFCqGVNv5GZjw4PYDwrqstQlS2
         4m62xu17x/4w9W1CAXzbtGcq/JALIyz7Y3BvRFY6XYBskJ7tl3W2nRzSOKaUeR3eE3vN
         86I2Xj87J/cU6yCjXLNqbpThRG6AbBQvUzi/9IEvRIypazuO5JepEdWJ7tpAuso28g8N
         Ha5BkaDNt5o4xPtdD0I3t5RhRRQf8ydRlI9bu5UbGS9Fve6hbxBOPP07PLJV/9bgSqJa
         eI4Vizq6J3ScwI+krQdsPxEvAOZDkhPTaQR4Vy9jlCfZMcDl0KZkUlOoKu877tx1iWO1
         kXDw==
X-Forwarded-Encrypted: i=1; AJvYcCXDAPp5YEmsKuCNSTWIBuxhTiuIBg3CbWkRzR7n7jX6BpucwVARojVfFTFhD50OqufJVkZ37UoKbHrS@vger.kernel.org
X-Gm-Message-State: AOJu0YzZc7c5Gs2EpUmZOSJlzaVvImgvlj6TpfvJ9kT03SYWQ2WD+nuF
	7nNirSqrv/Hpzn31mwa8dnaQPJJDT+akFYtRdzEpQDD+vAXCKyl4xU4PeO6penHiLxU=
X-Gm-Gg: ATEYQzy/Kl+mlJ4gF5deAZYEQkEXoW+xYeX+mJXb2LY7wJ9OGPYDZOuc2f2IFvvAzax
	AhF4pkv1HJDCvQCUnnlhdVUSlNbZ0jd1uuMUJZFnApdVf/QlYc8Ld0XHLdFRMttNPmy/gflMc8A
	B10Dep3Ck3r5jG7AXXTsB9vAoWVIt3rZM6Uh6u3m7diLaQphEXTN7rUGH/0QQhIDPYAVWMkKEIL
	sfnWQ4ikLqyp1qWJv//NMrdblqvqxJhkmrzWMHmFY1VpBdbjZ6sFRXImqIlB1v+4ddxOIXCOoTq
	3i6+UqKWHuhWwNMGXimJDDPilqfhEVzGt5oMXCtXTKvte9FItymqOV98ZzXGrmgxYeL2MVbJDnR
	z2ZoKevLIg5xS+Djt7czy68WKQuscjGACS49CGEtWLn9sJZjtuQqqwy0bhJAt2jrmkn+HJE5Lre
	thnAC6VEGc8jnduOfzl0gv5Id3KyOm
X-Received: by 2002:a05:600c:3490:b0:486:f8e9:add5 with SMTP id 5b1f17b1804b1-48716042c08mr101023585e9.19.1774517416931;
        Thu, 26 Mar 2026 02:30:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c957b9sm35804605e9.8.2026.03.26.02.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:30:16 -0700 (PDT)
Date: Thu, 26 Mar 2026 12:30:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Tom Rini <trini@konsulko.com>, AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
	Marek Vasut <marex@denx.de>, Greg Malysa <malysagreg@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Yao Zi <me@ziyao.cc>,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Anis Chali <chalianis1@gmail.com>,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Utsav Agarwal <utsav.agarwal@analog.com>, Ye Li <ye.li@nxp.com>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>, u-boot@lists.denx.de,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org, linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH v2 3/4] scmi: pinctrl: add pinctrl driver for SCMI
Message-ID: <acT8pMQkFd2NKMTf@stanley.mountain>
References: <cover.1773256350.git.dan.carpenter@linaro.org>
 <1048331f5d3c8e0cdbe1542bcb65bbf942a4275b.1773256350.git.dan.carpenter@linaro.org>
 <CAD++jLmfRVGGHH1EqMAeSVHVCr1-s2JPyuY_w=2h35_mKUXj2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD++jLmfRVGGHH1EqMAeSVHVCr1-s2JPyuY_w=2h35_mKUXj2Q@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34195-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[konsulko.com,gmail.com,nxp.com,denx.de,amarulasolutions.com,ziyao.cc,analog.com,timesys.com,bp.renesas.com,foss.st.com,renesas.com,lists.denx.de,intel.com,oss.qualcomm.com,vger.kernel.org,linaro.org,arm.com,amd.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:dkim]
X-Rspamd-Queue-Id: BC4743326BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 02:19:34PM +0100, Linus Walleij wrote:
> I really can't endorse it though: with deviant device trees and
> information stored in paralllel in two places we create a
> maintenance hurdle.

Yeah.  Looking at this more carefully, you're right.  Let me do
this in the right way.

regards,
dan carpenter


