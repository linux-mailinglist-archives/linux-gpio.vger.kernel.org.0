Return-Path: <linux-gpio+bounces-15333-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B757DA274C3
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 15:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E8471882B9B
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 14:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D9C2139CF;
	Tue,  4 Feb 2025 14:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="qh0XkdRg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334A62135D1
	for <linux-gpio@vger.kernel.org>; Tue,  4 Feb 2025 14:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738680444; cv=none; b=Avndgu6S18COpWnxTBQLirfFLQGbtQKuodd4TcEAgDRo5t38o0kWJols+NgVMomTbUw7Mm4cav/qlk7hRxKSbZJ/npq+TqUu555PY1rGGJvIClR8k29wvXrtgsQ5UeH49XEi1WreV6IiP//4UFGXpSR/VNPlVag6+qZlwCMplE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738680444; c=relaxed/simple;
	bh=9sSUvA2pf9s68H5xIKqnGcIqBfggQlWyoUWMwKLVlPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7DtOKryZxuFSZVhv01nfS2bcZ/GNoJHJmP/mu9sDcnua4SQcbmBmz/8wHtiDzZDSlaWUCOIyFOo1LYrNrtiYGlYeYrMx5TrD+IbbyngW/f+vmAcDsonvkazPaZN2guTryEd6wrtmxik9WzBQHjqEpsxKhAb5Hep3d6p1jWQQkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=qh0XkdRg; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D003E3F322
	for <linux-gpio@vger.kernel.org>; Tue,  4 Feb 2025 14:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738680435;
	bh=n3EGoN50SBFmj+V3N+sn2G/FlvdwJ5OvZq5vVoZVOtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=qh0XkdRgasojQT3dkdOweElhc2EfqcAUGRJ5yFCxpR7iJxLXpkqnspKk3lm08bWnv
	 tvRPlXSM2RpB56BP4kA2ehbFVIH/beexGjmmgwRBj4d3EYW8zEY/xJTwCtjY8z8RzR
	 1PW7cPDZ5jxoWzDqaBFwxEJWqdqDvV/rc9qEGN39aicnhYhnszmq+VgsKAOK6AGBfu
	 nAEuYckRfBf8D2B7xFvomlFoh9JEESMkKNQCzAzJ8oWApgf900Vq3CHGI4UdDXQvvC
	 E62x+O25KSZEgYE4lPeG7/LGRlkourlbWH8PsqAMAWM5Oo/XcLhBHPBJvhu8yMx1HT
	 z2QogobxgmyQQ==
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2166a1a5cc4so121588355ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2025 06:47:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680434; x=1739285234;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3EGoN50SBFmj+V3N+sn2G/FlvdwJ5OvZq5vVoZVOtU=;
        b=qhxxiqvTYF2hI6sZHcP9zXhMU/NkBYfw+jxWbAS7YBuIl8XuKmZOhVSXiucq1IEKLG
         pMV09cDVBEE2hSTtz+hNua+Z/vhGwDn8l6XnUM/MjvpJxbdely+q6fp/PNxaqsDC2mJp
         FyhCd/8UlPMsYVPVPqdALHrtviO8oknqwN43Btu9LA28aaFp5LJ4JwPiqBkY2Z+UAeVw
         iBNQuG6xhxIEsxR8hx7U9BChlDogyRs0mdAnAm249XyrREVxaffzprq9sm5chYU/josn
         ee7wmdZf4xBBixpoRqbKzFSr4gVN+bRQrhZGxacQCwJub6n+M0GOaCvUoZ37G3s6e04e
         kx5w==
X-Gm-Message-State: AOJu0YziqFmq7WANZ5SUZxG/gVhppGFbZG/Um4LlPx+q5jrsIMPN0+QA
	/dVofmV2e4C8C0Zt86gTbL48j9ISasvKUlYkC/8pOy3CySLJNmEcNh7vJYqVpx410AQ1x2AZRht
	yF32JQJ871ZaHAjI7Q7z4Q+u+uLFIlMR83ziIHJnBrAiwXBrQeT9KhKAOgW8IhTMfB4BLKg28ay
	w=
X-Gm-Gg: ASbGncv04wuhFc2Ik/BnAlmM6a2BLCNRIUVi8VMAElfhePGf337rrlSJQxz4dpNjoLq
	CV6QcaRnJfn5ZTzJdImn1KMJyqemjgei5rC1DtqGHS9uI7uHyFLDTNOOY3oaHdrAB/y6hnlxhY6
	iyu8vR0iFZLgbispVkUvfO3U46fxmZK+isGXDy6QV16cjmZgxxzIpCsKXQBy8ymasxdAgNm8sdJ
	sAYwShWleZbYK4h4OCmm+u9Vlrs0og1nSTpxc8VCGWdkHNTSQ7eL/7QmlUHKis5zWPEAIxjhV6P
	THdcNDo=
X-Received: by 2002:a05:6a21:3399:b0:1e1:a094:f20e with SMTP id adf61e73a8af0-1ed7a5f06e6mr38741351637.17.1738680434208;
        Tue, 04 Feb 2025 06:47:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1EH4i9UWmswnm5lEyNNQ8DxaVfhJd/Qske9LY23x30Up5+/d5qYK4fAT8keB6BiGvn+0GGA==
X-Received: by 2002:a05:6a21:3399:b0:1e1:a094:f20e with SMTP id adf61e73a8af0-1ed7a5f06e6mr38741322637.17.1738680433910;
        Tue, 04 Feb 2025 06:47:13 -0800 (PST)
Received: from localhost ([240f:74:7be:1:45f0:d4ba:baba:a275])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe653a9basm10550590b3a.78.2025.02.04.06.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:47:13 -0800 (PST)
Date: Tue, 4 Feb 2025 23:47:11 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/10] gpio: aggregator: expoose aggregator created
 via legacy sysfs to configfs
Message-ID: <dm3enfd2hlhktozbax44h73qo3bw6bj6sqru62hi5pglv7fn6w@buve3k4oyfv5>
References: <20250203031213.399914-1-koichiro.den@canonical.com>
 <20250203031213.399914-9-koichiro.den@canonical.com>
 <CAMRc=MdQuQnmqFravDfvcoN_TUXgfZnJh5UxdRuYhECfmvAhGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdQuQnmqFravDfvcoN_TUXgfZnJh5UxdRuYhECfmvAhGw@mail.gmail.com>

On Tue, Feb 04, 2025 at 02:12:33PM GMT, Bartosz Golaszewski wrote:
> On Mon, Feb 3, 2025 at 4:12 AM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > Expose settings for aggregators created using the sysfs 'new_device'
> > interface to configfs. Once written to 'new_device', an "_auto.<N>" path
> 
> I would prefer this to be called "_sysfs.<N>" as it's not really
> "automatic" - the user did create this, just with a different
> interface.

Makes sense, I'll change it in v3.

Thanks,
Koichiro

> 
> > appears in the configfs regardless of whether the probe succeeds.
> > Consequently, users can no longer use that prefix for custom GPIO
> > aggregator names. The 'live' attribute changes to 1 when the probe
> > succeeds and the GPIO forwarder is instantiated.
> >
> > Note that the aggregator device created via sysfs is asynchrnous, i.e.
> > writing into 'new_device' returns without waiting for probe completion,
> > and the probe may succeed, fail, or eventually succeed via deferred
> > probe. Thus, the 'live' attribute may change from 0 to 1 asynchronously
> > without notice. So, editting key/offset/name while it's waiting for
> > deferred probe is prohibited.
> >
> > The configfs auto-generation relies on create_default_group(), which
> > inherently prohibits rmdir(2). To align with the limitation, this commit
> > also prohibits mkdir(2) for them. When users want to change the number
> > of lines for an aggregator initialized via 'new_device', they need to
> > tear down the device using 'delete_device' and reconfigure it from
> > scratch. This does not break previous behaviour; users of legacy sysfs
> > interface simply gain additional almost read-only configfs exposure.
> >
> > Still, users can write into 'live' attribute to toggle the device unless
> > it's waiting for deferred probe. So once probe succeeds, they can
> > deactivate it in the same manner as the devices initialized via
> > configfs.
> >
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > ---
> 
> Bart

