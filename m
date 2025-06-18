Return-Path: <linux-gpio+bounces-21813-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4923EADF3FC
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 19:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CED21BC133F
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 17:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883292F3C32;
	Wed, 18 Jun 2025 17:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YjUlKN6o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4932F3C2A
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 17:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268279; cv=none; b=bUn4pwxSREthiSEAJI/zHPsZLJj2swAzMzANtBvNZJzXpXEI+FmkmhhosUI2f+HKGiddDNEhM+6bxvKUyeeN5Y6Nng+nWYQlDXqrSB8+9X3cR8XMHHhUS2P3TIgwcRZ9dnmXlpyRUkD7x9wH1kewCfZ4yfXkrgLJw4qpdjpYmKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268279; c=relaxed/simple;
	bh=dSwvZmhnUv9vUtgb4j2wEBivI04TNySsv154Cfug3uU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=kYpABeP0YxkWrvmk68LoA8pqQR713VdnXBtkh+gvzEWKTfgHacJM6vokwV5IT5cxnFdSXsbsoipfM3r9aPPNHXaERDxiuTnz45h7na7C/+6MGuMxwWTa0voKO7AhEvjJQ4kR/cUl4OVeHHX2EIpH7gCjWUO8faUvBvw78SPLvxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YjUlKN6o; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-40aa971550aso541651b6e.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 10:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750268276; x=1750873076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J5aw8HhvYF7rtQGj4otJAqopWyd24EowRxeQggi5V7c=;
        b=YjUlKN6oDJBLEChi4+/FhQ91lDeBD6KEBHoRs+nJHY58W6W5XAIc+97LkUW4gbDmUR
         AFOLlNeiFz5YKdJqQdoU0PqSfVBYTCBh0w9/zNStufnpaIQY4tscbpnMmB6jf/WhwirV
         RzoJHlEYmvucS6H9Y5PlM3kWK5aXhdOBeVz57IRkvOMhLp+Wmmt/R1zbePOHiMV1yXMM
         Q1RdKaRV6NM9m3qyUtLUlgA0xcygdApGUC5PaEOVRq+oTq4v0xvTURJZU5KE6x0sUcYh
         nEai6svPJ0pK77JOOaORUI1swPN+FNwSoQ8fCp/eS7qzKbvqz0TMekDHNTt21zQzmaQl
         ughw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268276; x=1750873076;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5aw8HhvYF7rtQGj4otJAqopWyd24EowRxeQggi5V7c=;
        b=Xz84w9f86up+WrzA/vuWqvht6ZLj01exEbaajOeEEvZs1eVXoT5kwek5SzoJD5JGhg
         6g6mAT9PBrLLL7HmOUPgUrYgbzQ6moOcmFqJMVBs+5HFAPec0qUVCbyL8wOTVuMToWSC
         lHcD2u++dgbqELVK7CnPGPH3tJ2i84I2Yx2VQHmJSSEjhE0hILrzOlJKyOZ22JuUXzM+
         5CaH5KjvILlhCYowy0UDU1vKYk3kTb6s63f2GIkM0q1NduAWzTIUNbeQXM+pr1kGkUGX
         q/P6aOyJZR70ibpQQLJMQZhxoSMN+6Ej4ISveDR+OriD2xlSQ/vkVqFvJyJm0hkc2y8V
         UtKA==
X-Forwarded-Encrypted: i=1; AJvYcCW9ciwM23sO7dfvdUrbv/IzT9eEvzXWC7FDrkbmIOEtgnOicEKiKaW9nq9/UqSb2gW0Fcs8q8myQwB1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/MILG5aQhr4EAUZJudHMELL7RixI4WdQVHEZOk8JgTYe4bTIU
	c8VkHT/tKv8NUdu7OAT5pAf63HuX4rpwX3ZhMpjIayKdk8S/i6AMYUagTPVjVtTVngQ=
X-Gm-Gg: ASbGncuCTL7NoqYhX7Utrc1sEeOnvgjhE2EPhN9j0vTH0+wS4IYVA66BlRDIYvlLDr2
	gQ04HCHqiRCNk6o7JwGcxQe8zYoqY6Jnn+ueKwkXsS+z7t/QwCpGF5vCECGNbB4Sl9RHtmnFvwZ
	fLawBD72Mh0p5HEvSCRcDQeBq2pDYq0flbd14Tqj47klylnYQT6cY63bQASDKlWQeMQSsVukUW+
	UZWNp65n5V3nTH8ht6MS0UpcvaNxJC78lHvPOQR/UkOM4aKS4//woNciVaLQWo6pvFhYHT4P536
	4w0nPbd7dcCE0hWc0Rl+g28FxarZSe8f26HgvGH9HJ3DTOYn1ExLCUZKRqvdf5GE4pDU8w==
X-Google-Smtp-Source: AGHT+IHJf4DIqbuT4kMFEWquKQMMdw0WGjrkTOtMGLhJHqymSh9M3ASnzaQnXSIrz/mcQrHGd0u47w==
X-Received: by 2002:a05:6808:3024:b0:3f7:e860:b5f3 with SMTP id 5614622812f47-40a7c17047bmr12151301b6e.22.1750268275537;
        Wed, 18 Jun 2025 10:37:55 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a7418b932sm2358659b6e.40.2025.06.18.10.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:37:55 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:37:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Marcelo Schmitt <marcelo.schmitt@analog.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ana-Maria Cusco <ana-maria.cusco@analog.com>, jic23@kernel.org,
	lars@metafoo.de, Michael.Hennerich@analog.com,
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linus.walleij@linaro.org, brgl@bgdev.pl, marcelo.schmitt1@gmail.com
Subject: Re: [PATCH v5 02/11] iio: adc: Add basic support for AD4170
Message-ID: <d6ae8122-ff38-4fca-8e02-f27c7ac2ccd8@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48598c0753cccf515addbe85acba3f883ff8f036.1749582679.git.marcelo.schmitt@analog.com>

Hi Marcelo,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Marcelo-Schmitt/dt-bindings-iio-adc-Add-AD4170/20250611-101842
base:   4c6073fec2fee4827fa0dd8a4ab4e6f7bbc05ee6
patch link:    https://lore.kernel.org/r/48598c0753cccf515addbe85acba3f883ff8f036.1749582679.git.marcelo.schmitt%40analog.com
patch subject: [PATCH v5 02/11] iio: adc: Add basic support for AD4170
config: powerpc-randconfig-r072-20250613 (https://download.01.org/0day-ci/archive/20250614/202506140009.GdV0BtKr-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506140009.GdV0BtKr-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad4170.c:1181 ad4170_parse_adc_channel_type() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +1181 drivers/iio/adc/ad4170.c

dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1170  static int ad4170_parse_adc_channel_type(struct device *dev,
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1171  					 struct fwnode_handle *child,
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1172  					 struct iio_chan_spec *chan)
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1173  {
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1174  	int ret, ret2;
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1175  	u32 pins[2];
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1176  
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1177  	/* Parse pseudo-differential channel configuration */
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1178  	ret = fwnode_property_read_u32(child, "single-channel", &pins[0]);
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1179  	ret2 = fwnode_property_read_u32(child, "common-mode-channel", &pins[1]);
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1180  	if (!ret && ret2)
dfefd2b2405829 Ana-Maria Cusco 2025-06-10 @1181  		return dev_err_probe(dev, ret,
                                                                                          ^^^
ret is zero, so this returns success.  s/ret/ret2/.

dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1182  			"single-ended channels must define common-mode-channel\n");
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1183  
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1184  	if (!ret && !ret2) {
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1185  		chan->differential = false;
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1186  		chan->channel = pins[0];
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1187  		chan->channel2 = pins[1];
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1188  		return 0;
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1189  	}
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1190  	/* Failed to parse pseudo-diff chan props so try diff chan */
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1191  
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1192  	/* Parse differential channel configuration */
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1193  	ret = fwnode_property_read_u32_array(child, "diff-channels", pins,
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1194  					     ARRAY_SIZE(pins));
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1195  	if (!ret) {
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1196  		chan->differential = true;
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1197  		chan->channel = pins[0];
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1198  		chan->channel2 = pins[1];
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1199  		return 0;
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1200  	}
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1201  	return dev_err_probe(dev, ret,
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1202  		"Channel must define one of diff-channels or single-channel.\n");
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1203  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


