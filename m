Return-Path: <linux-gpio+bounces-10987-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5DA9935A5
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 20:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C87A1F23F4D
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 18:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F341DDC0D;
	Mon,  7 Oct 2024 18:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="Dh5qIncH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCFC1DC054
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 18:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728324240; cv=none; b=ZoxQvCrILA2x85r5F3HqzV9fLvq0B+xET333Cl2XiHHx053mGZpsQ9HV3sHV5syvegg1/kxX1v2brfd+6gzq+yYfPBE6B9y6+kxKKNSdUNql4GWQr67MToGmE/0qA0nh4GHGV/4dTOiW6KSJaksJqgk+AIibrc6pi7d9ekn2bnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728324240; c=relaxed/simple;
	bh=I22d/+GHsIHGfgt+4eFMnOhieCI52FZK/3/kffHd95E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HiwBt3n7BQZHyDir5hQ7XGFWV9ONWVzMGgwZXNCldFktaxL1NX0608JJZ+m9Sv37+VKX3AoSPCMBYj8+RSf0pm1hJSPYUdZAcRcYWgGvfbUf+60/gh75HYaeoxoyfgIzPRgCkKOS3P7dW+QhEX6yjin2IhIFXylj+haheD+6Xok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=Dh5qIncH; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71df67c6881so1911110b3a.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 11:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728324236; x=1728929036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MVGSjDknVMXjQYoTQZQyn6ion9DZQ87YWfmvoPAOAL8=;
        b=Dh5qIncHHp50VNMdKMlpNW8f1eVoYb2hDlauhPIfd+ZItpQzxe54bpqy/VNRwcDPw6
         jpq99DOM5znGqo/Udnsfdr7suXCDfcFrAxr+15cAB/1uKt2lQsx/cqLNoobZzkPCR1nd
         Ew0BW+FLVMq5vDXiW/1NEANb8v7g+8+xDmdbI3yxsUaPyfZopVOWPnJRWPckRTn+dtOB
         7CzqkRJeDvdfcQ7hzPejQTaQ62dZrr1ksv6lsXw+MAdN4PvjDRV8w1YsE7oSB2entVzC
         gbr0aYi7BUtRdm6xf7KyorcooLC5b732svFs8zbuwai0hkEWRm2LMbeVLyRAI+be5xp9
         /RvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728324236; x=1728929036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVGSjDknVMXjQYoTQZQyn6ion9DZQ87YWfmvoPAOAL8=;
        b=ksfXgrufJ+oNOB2CoSjRS3oaGz4LpLm8aV5D5uFjjpbDk6b78WptrYTa1K0eoy4ZQG
         nrikndnpSXrd/lp/9AKXW8t287XCxUxgn3J2p4LIEBRnspcHIiBHq4xSHSIfZD4GheSg
         KciKq4OrX8viI8UVKGrWGPuOP4GSRkqTfP61RRzXXZsQ+OVy3kqi+7DKU+dBWh1Glafs
         JiZYlirrmi2DDt2mK7mSrTViSLomBlxJgGcSVRSAFRV4ZXE5qU14mGN5U415JqhKAqMq
         SZFGb9Xc1JbrSkw/pWyOfH0eoHwnrK0CJQ04xUQTGhsprXQhW7TdCqfImdooVOFXiJ0E
         zPsw==
X-Forwarded-Encrypted: i=1; AJvYcCVxCWiVRgwqP3Xl8o5Qm6ahRswWZwjYluFcXVUpSnWAU8c8C5B6uMEXZf7cPttMiONiauF6OV9wyQTT@vger.kernel.org
X-Gm-Message-State: AOJu0YzBEvHw9on51h14Y2CINCUT6EZGtoWF4YvGaJTC8BEX7htWJS6J
	QMSguS2Egj8RsGM/vTULoCmgWOn+45ylYonIl1bSBWr6NDhdcNM9rEmf+6D/V5A=
X-Google-Smtp-Source: AGHT+IHtCkLsJksWiActtwWLrS0eD/m1ABPJG3RzxhSPeEyDzgju5CyXRLJOluQztqFFZN29rhif1Q==
X-Received: by 2002:a05:6a00:2d8c:b0:71e:b8:1930 with SMTP id d2e1a72fcca58-71e00b81b19mr9261207b3a.16.1728324236611;
        Mon, 07 Oct 2024 11:03:56 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d47edfsm4662653b3a.128.2024.10.07.11.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:03:56 -0700 (PDT)
Date: Mon, 7 Oct 2024 11:03:54 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: kernel test robot <lkp@intel.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
	oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] pinctrl: th1520: Convert dt child node loop to
 scoped iterator
Message-ID: <ZwQiijdDKDHvwcOx@x1>
References: <20241006-th1520-pinctrl-fixes-v2-3-b1822ae3a6d7@tenstorrent.com>
 <202410072033.XpRqZ8nz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410072033.XpRqZ8nz-lkp@intel.com>

On Mon, Oct 07, 2024 at 08:26:28PM +0800, kernel test robot wrote:
> Hi Drew,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 2694868880705e8f6bb61b24b1b25adc42a4a217]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Drew-Fustini/pinctrl-th1520-Fix-return-value-for-unknown-pin-error/20241007-014953
> base:   2694868880705e8f6bb61b24b1b25adc42a4a217
> patch link:    https://lore.kernel.org/r/20241006-th1520-pinctrl-fixes-v2-3-b1822ae3a6d7%40tenstorrent.com
> patch subject: [PATCH v2 3/3] pinctrl: th1520: Convert dt child node loop to scoped iterator
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241007/202410072033.XpRqZ8nz-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410072033.XpRqZ8nz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410072033.XpRqZ8nz-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/pinctrl/pinctrl-th1520.c: In function 'th1520_pinctrl_dt_node_to_map':
> >> drivers/pinctrl/pinctrl-th1520.c:420:29: warning: unused variable 'child' [-Wunused-variable]
>      420 |         struct device_node *child;
>          |                             ^~~~~

It seems this is because the scoped iterator declares *child in the
macro and thus no separate declaration is needed:

 #define for_each_available_child_of_node_scoped(parent, child) \
         for (struct device_node *child __free(device_node) =            \
              of_get_next_available_child(parent, NULL);                 \
              child != NULL;                                             \
              child = of_get_next_available_child(parent, child))

I'll fix in next revision.

Thanks,
Drew

