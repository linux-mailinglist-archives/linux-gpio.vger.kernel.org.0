Return-Path: <linux-gpio+bounces-34080-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aD1bLCF6wmnqdAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34080-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 12:48:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 42490307963
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 12:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29F03312827E
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 11:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7C53EF647;
	Tue, 24 Mar 2026 11:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rKS5hhbJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100393EF667
	for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 11:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352448; cv=none; b=sG7iu4VGqKxHSocUuuqAO/4+1dW3C0aCgrk9ZWHFl+eDpQ8NT32k9+ZtiNzSBDf/3A26vDjFsFqyW8Y1cl+J5wA5IvkyAgQECnfIZIFhF0p7XvIQMUz1w9o+wYIqxx11aYgZdco3RbXtlQYlG/1wHiFkWCL1xjXClBrjrXovUmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352448; c=relaxed/simple;
	bh=9K31B+KMgL2pWzK42966IOpc+REPzpYxrHPyhZW4u2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3lIEbzvLo1PzaFm1Hd4qK5ZtN0g0h7TzrbVKdUjTjbfkDivZCXWnT15dHdebvCa0EH9vwDWnQNDxz9qRAZbNazs3RiaKx3VNoCMJNwyU8+SpzJazqHGVrBHdq44cjlfQQ0M/9zUZvji0+tvVEzkMJTx+O2Q0fLP5jsPgNYFeKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rKS5hhbJ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486b9675d36so43183175e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 04:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774352442; x=1774957242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ndr81qWrh1fbHF13yyK1nq93jUzU2WWIcf+1FEmV7LA=;
        b=rKS5hhbJ4QdR7UMiUbJd29r1X3n5bvidkhitudYIqWUNKo9Yo9rrVLc1dSRuNSX22b
         l1s29M9bDTMQ/f3TeeAtx3s+oSGfRCZ1f91I33R88T+gZQkSLnW+PWyBB/SN5TjedAZn
         Zq4fb5TC1ZQAYTcDja+lKCmNUwK1S36zINY4vocV1YqPtRu5620ufUg2sKHlxu45qriC
         Fjg5eXRLm+dJ2C+zSWP1UiQqnedi37s26LieCspkI/7vlV3qsN5Vr7v3jUp1ufIVkrfq
         3hDuDWDXF7O+F5pcIM5ERcl5V6Acffwk6TeVS1C7klnMwO74HxXfPxOAQu26TV9hfojg
         2kFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352442; x=1774957242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ndr81qWrh1fbHF13yyK1nq93jUzU2WWIcf+1FEmV7LA=;
        b=UbjKA9D1VBp5iM80JKSwJNViAlvRGEeywFdt506g+FqQigJaKx1uaH5mg2gLbxUamn
         Agm03KF6Dk1tu36yfGkxEKx+FQxLEOZt2QCjYa4MNMAJEZD+9V7B3nFW7ZJSg+3EcKYj
         fGD5xZ5ixk81ur4iuzWmy5FZKm/1csarbgeNtdisEleaPog549pVmvBACSRT8B1JofH2
         syErijcFq2cEkMXjE3Bz7FBMz4hY3x/nWqOnRKk2l/q+vx4yGNzXZ4K9CO107Y2g/zoC
         gtwSxVyO0kJdC7makvieuillsZ0+7WrkOae8uEHt9ESMctAxva5aaYxKKz2Tc5VMqB3l
         32gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgaYSk7g8gwGbK3k5NrUVTCv4ibE/D9zRcqLi3DF1GUrmXbhdfR/bvob4XaZwOlLEKojB2fFM+f8qU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9VjdP2pVle+OJgaYrXyi1B/djHaYFMbEpqdquaF+shlrOdMhl
	vtmNsirJvGipHJ69Tw+dr6T4xwpLW+6I5AipPhLSb9pliFhB681VfxhIGIcZz9G0OWo=
X-Gm-Gg: ATEYQzzgDd7Pza8tGjZxs6b29i8OG31I6ZVlDjLkobnjb9N2+Go48h4kIW/Z5dbORvK
	3v8SxMOV32LXc9825l7R9jaqkdF3GglubX6KMpz2R6QcSQBiX5IvWZYwPyJ7AgVoaumQyvM5Hki
	bJs02aqwcaWQhT04uWNNgc8ZfUBoY6q6hcAeFKF1uhuFR5kiRLZdhFPbDdGBTwEaUZCTyGnElsB
	Dt7Mr0OVJvivE4v3ThlvxqOEU1MhgxZUW9DY9sawj2zpzm0D1pijfhpTZIZEEuhAySeLkk3EMAk
	OodhQpK3PKIfR5Yade5Mbz7XHjZvXz4FWgJRpMVOTNguBWawt4o2+G30768i5aSTDfrB1PVSKV5
	xKa0gl3abJJpkWQJ6qilPcrnVcsG13Qknl2dzpq90F8drZYJvnXLA9Mvc4mp74nZywaRObNwXTJ
	1j6HTwFtIMZ6rWUI7bvFPNhRP4JUHH
X-Received: by 2002:a05:600c:46ce:b0:485:2f4a:6ae6 with SMTP id 5b1f17b1804b1-486febb56demr206987245e9.6.1774352441962;
        Tue, 24 Mar 2026 04:40:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711701804sm47542065e9.4.2026.03.24.04.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:40:41 -0700 (PDT)
Date: Tue, 24 Mar 2026 14:40:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Tom Rini <trini@konsulko.com>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Peng Fan <peng.fan@nxp.com>, Greg Malysa <malysagreg@gmail.com>,
	Utsav Agarwal <utsav.agarwal@analog.com>,
	Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
	Ian Roberts <ian.roberts@timesys.com>,
	Oliver Gaskell <Oliver.Gaskell@analog.com>,
	Yegor Yefremov <yegorslists@googlemail.com>,
	Philip Molloy <philip.molloy@analog.com>,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
	Eoin Dickson <eoin.dickson@microchip.com>,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanmay Kathpalia <tanmay.kathpalia@altera.com>,
	u-boot@lists.denx.de, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org, linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v2 4/4] gpio: scmi: Add gpio_scmi driver
Message-ID: <acJ4NiwCRchgq7-t@stanley.mountain>
References: <cover.1773256350.git.dan.carpenter@linaro.org>
 <f8e1dcb617917dfe69efce0b3407f8786e4c971d.1773256350.git.dan.carpenter@linaro.org>
 <acC2fSdjDmj5Wp1a@nxa18884-linux.ap.freescale.net>
 <acDzsKoMdfcXecca@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acDzsKoMdfcXecca@ashevche-desk.local>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34080-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[oss.nxp.com,konsulko.com,gmail.com,nxp.com,analog.com,timesys.com,googlemail.com,microchip.com,linaro.org,altera.com,lists.denx.de,kernel.org,oss.qualcomm.com,vger.kernel.org,arm.com,amd.com];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 42490307963
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 10:02:56AM +0200, Andy Shevchenko wrote:
> On Mon, Mar 23, 2026 at 11:41:49AM +0800, Peng Fan wrote:
> 
> [....]
> 
> > >+	ret = snprintf(NULL, 0, "gpio_scmi%d_", bank_cnt);
> > >+	uc_priv->bank_name = devm_kzalloc(dev, ret + 1, GFP_KERNEL);
> > >+	if (!uc_priv->bank_name)
> > >+		return -ENOMEM;
> > >+	snprintf(uc_priv->bank_name, ret + 1, "gpio_scmi%d_", bank_cnt);
> > 
> > build fail in CI [1]:
> 
> Moreover, this is reinvention of devm_kasprintf() to begin with.
> 

devm_kasprintf() isn't an option in u-boot.

regards,
dan carpenter


