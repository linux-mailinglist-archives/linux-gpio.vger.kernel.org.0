Return-Path: <linux-gpio+bounces-5950-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A52D8B7B36
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 17:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03B7C286821
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 15:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DDD277118;
	Tue, 30 Apr 2024 15:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bzJN0UxX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE227710A
	for <linux-gpio@vger.kernel.org>; Tue, 30 Apr 2024 15:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714489855; cv=none; b=ODTy25sb/yj4BJTKVPdS5PsEP4VUDB/qMmAdW06oXss+7EQPtrTCtpGnY/MOTLwV1cxMY8OVfCLQ75Cvnx78kUdBPmcxXENkttjV50mGyij41iACpj9pzxUy7DIBNctJKM8S0zqIROU0AYY7veAQ7oAJMsGF7LwBDHx52KkW5S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714489855; c=relaxed/simple;
	bh=+ggA8kXwmpMsoeYlM5rsR8YzzjcltXB9K7VgS76LT20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cl5dJxsBjf1mRNSvKzlHwzDKMS+vTnB/CLK0S8yS4OB2Z14gwLNAKI9S6qbvnzKP0VbU2Hz/5tKRELuGev7TD62eNReu6wBShSJDdwlWA3J3u7Wr251BWXyArI/PN7F3T2UkJDbhm7dMc1Uc07OctT9F1PfBdIkfLQcXkVw46ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bzJN0UxX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41b794510cdso37028065e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Apr 2024 08:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714489852; x=1715094652; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FoNbL1otlIxZgmhvKJLjnRUQ+ehkgEVScvtuFLOElk8=;
        b=bzJN0UxXrMrTCLJwKjdXSO9XFwhezPNzjAve2+Gi7vNinv1rEm21CJni9nClqzOjuP
         ZGljVnYNWXLO/i+g35lkYiDVaYDb1zdigm5jshWKuWmXobIqkGzx3O87lO5ZaTMWiF7v
         mPz5K0B8f10Wg08G9K72Vj+fNthyIaH3eEAehidn5F/5tZUNoCm+dOkzQesUf7cWl4Y8
         huevUo+44P1IKz/a+NBSo37TUPpnvBuPJP1+jno6ziS/xsLQUuHg9PebZ3z29MlniW8r
         HtwGBw0iJgsNGrrCPeWpXdu4o4Fw6GR3tBqDyiinA3nITOAEV+32nCC/2ncleEYhiD6j
         4cnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714489852; x=1715094652;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FoNbL1otlIxZgmhvKJLjnRUQ+ehkgEVScvtuFLOElk8=;
        b=TtMjgpf/KfBaf23/ZW+LMr2LUy9D4Etv7MRuI2371MALtUUEy9eA6KS2CCcIE7o2tc
         YN9vMrsoRqbgpj7Mkhhk2Kp5Sebe7ARYYp70IqukSVJhPj4MRs7yZyHmY7TvyV2USZ6j
         BUpEC53TEWHDVz2xfbRBxkXc5GpNypdttArLCmDUdwzCx1IsvkCr8GUdz6TYkG8Pxo2/
         wQZ0jP9WljpWSoGoT+XnGxtjsB+C/lhRuJ0PmLprmJocgGa3ztH5nDsDEfwZkwXFSttK
         gmOamVZ9RV8LD7KgvbqbLiKWQSsaMdDjzzLT/1508d7aEuSQ9RrUWwFk8cAwGjpf10Uq
         nnxA==
X-Forwarded-Encrypted: i=1; AJvYcCWsWh/m2UPsRetLrTNhdyKegAvFhgboVgglccTPMJt9MeuxoQkTHK4pqupyg54nFfawPjHMs8wRB65m9ZkcO9UKhHHIuDCIO9AXUA==
X-Gm-Message-State: AOJu0Yzim+TiLGI36KoYt3aTd8GRVraBa51fkCTg7ODnhLdujzqNrO92
	ImOye6w5v7pw/zSBMq4YAOSbZAnIZ/HQ6VpvRmoCZWzBICQVZBk2fADeRPVFx7E=
X-Google-Smtp-Source: AGHT+IHN8GNDQe5D65ve0ojweVIrevfxwqcUzOR2YOMwYsfobgmsRztxhHwpyHsCU8V6PZ014Nhs6g==
X-Received: by 2002:a05:600c:54ca:b0:41c:258:9b70 with SMTP id iw10-20020a05600c54ca00b0041c02589b70mr2045652wmb.28.1714489852242;
        Tue, 30 Apr 2024 08:10:52 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id l37-20020a05600c1d2500b004186f979543sm49593289wms.33.2024.04.30.08.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 08:10:52 -0700 (PDT)
Date: Tue, 30 Apr 2024 18:10:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v8 2/9] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <0fe30dce-f1af-4bb8-8c09-3bec3867f473@moroto.mountain>
References: <20240430115111.3453-1-kabel@kernel.org>
 <20240430115111.3453-3-kabel@kernel.org>
 <CAHp75VcgfvyZ9rcNev9CpQEN3CkUVozEkv+ycaQggPbE4tx+1Q@mail.gmail.com>
 <20240430160507.45f1f098@dellmb>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240430160507.45f1f098@dellmb>

On Tue, Apr 30, 2024 at 04:05:07PM +0200, Marek Behún wrote:
> > > +{
> > > +       u8 reply[OMNIA_FW_VERSION_LEN];
> > > +       int err;
> > > +
> > > +       err = omnia_cmd_read(mcu->client,
> > > +                            bootloader ? CMD_GET_FW_VERSION_BOOT
> > > +                                       : CMD_GET_FW_VERSION_APP,
> > > +                            reply, sizeof(reply));
> > > +       if (err)
> > > +               return err;  
> > 
> > > +       version[OMNIA_FW_VERSION_HEX_LEN - 1] = '\0';
> > > +       bin2hex(version, reply, OMNIA_FW_VERSION_LEN);  
> > 
> > Hmm... I would rather use returned value
> > 
> > char *p;
> > 
> > p = bin2hex(...);
> > *p = '\0';
> > 
> > return 0;
> 
> OK. I guess
> 
>   *bin2hex(version, reply, OMNIA_FW_VERSION_LEN) = '\0';
> 
> would be too crazy, right?

Indeed.  Please don't do that.  0_0

regards,
dan carpenter


