Return-Path: <linux-gpio+bounces-37417-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOyDNF+PEmou0wYAu9opvQ
	(envelope-from <linux-gpio+bounces-37417-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2026 07:40:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DC12A5C177D
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2026 07:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 75C8C3003BC0
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2026 05:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5B738C42E;
	Sun, 24 May 2026 05:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKlH/3FR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5D02472A2
	for <linux-gpio@vger.kernel.org>; Sun, 24 May 2026 05:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779601235; cv=pass; b=hDjlhN79APxI2qDYjb9ZsiJ0OMq38FU07JEblaDZNzJE+HTBHXL/pVSe1PPV70K9mXr9ZaGgZy5pZdN7/Q6197KwN6jQ8bkvCfgiQXvODW6q9s03gsbZ6K7Sh9Hl9vveyWghAxbH0xyiSDeUbUWF4i4AJ3/SCDHsaUZEksJJLv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779601235; c=relaxed/simple;
	bh=FFyU0Agp3duT3812ugXRwk1O62+C0JSc7BoLG3Q5SKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WWW8wKvvr5He7A/cBHZSFN3SjsN6OXdFFpL79ZqZFDPT9P+a/WxrkIXRBBRscgaMKHzq1PrGTG6aEaqQmmcjgg0xBBxphKwNMMc6XCbe1IlEE+tp0s66mz1GvG1YrNnINjBW/Ln2g86q0/PqapuhR5aYOlKdCtAam2fAmCvDCNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKlH/3FR; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6530287803cso8671768d50.1
        for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 22:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779601229; cv=none;
        d=google.com; s=arc-20240605;
        b=fZloCuZWfTbB7WwWZQl+5WJ30f+8tGAT/gqgqhtN56yKGd5Dp7bd5xiN8SofIO4c2c
         4TCMHA8yYszCNMF9KZYz+hLk+gfrQMWQBh5FpdE7vM53RtUWoxyXBQshPo9CZQHBdhZv
         SJjOSOTe+E6BSxlDa9UdqDLOX0oVvTSy8yghH3WD1rEHcsYV78wpE31Dw0ndLq21sJ+m
         dOucKHz4cUTp5pkh71s8+SdMjhjZa5J2ONhskpuBGacCIiqa/NBqsSCYeeBKvzNNdFbj
         o/VSLJXJBI+qlAk4UgtX81D1bzdXipYOUN0XM0nZjeJLdn5hrGDI1oLmj5vZSzw2aIhh
         Mn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PB3ioTsenX/7iD7ox1ZYbQDoqdQdKnSJARyszLFCgQc=;
        fh=UxcEJQfcoZsW2MZcNaRbruzcGT74MQQ9EJvaxCRd2F0=;
        b=geGc5qewnHITbGqhlknPX0YnQUXx+IkKOdxGHQoB3U2RnauiaCZc/3CuVfRgVkP1l9
         HhNRJ4AjqNzJkjnQz12pO0Keue7XprQClvFazmBThZjpMTVbgMAw8udL7iclYSfJwXCt
         UoZPd26iQpS7AfvCsw6FmNzL6CPSWN7KjAtOojHaIb8hFzOolSbnctlwhhIsiZEPsAtd
         2PLrzlz8A+pKUb48xT0ORSZNpx7xGbP+O7h1yfOhAprB9ZlmACJeFFWeT64GFnD3cmRO
         q/Srh3Uq/+FZSOuyXLoCat7RsQKtvw1L64GdmlU0gQZKU5bqwa8ow+kXNMRflIZxTSA4
         mSGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779601229; x=1780206029; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PB3ioTsenX/7iD7ox1ZYbQDoqdQdKnSJARyszLFCgQc=;
        b=lKlH/3FR62bF+/nZ0Rt8+NRyfmFlviDPsRcURCfwx2j5PC56o5TCzeKle/vPtgbv/8
         DQEWzLz6WuuZDclc4IR+fmpgKt/adixj+ZonpOGmM+rhMmr1SkWsuTSfXOU22DUcnHyt
         /J8GgNHFh5HWqxJIc9OZ6ZscodV4bUeUxu3a3l1hZGjo+6Q7Q8qjYRU6x7MgRlngU/SD
         aQ36H+/XCyMIPPR+ZefQXoMEx4gGE2wY8c7/gMc0OMBTSw2EFClhXOVdJQZvRQPTxLba
         2hKG+EVFdajRt0IwL5HHbpNV7AgP1DP4sSpKc7NpygiaOl3qopYVVwrRiVtxFKpdkn0j
         jrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779601229; x=1780206029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PB3ioTsenX/7iD7ox1ZYbQDoqdQdKnSJARyszLFCgQc=;
        b=tDe74GAU7LmpdL5+daGN0baKqUgwHyN153Mu7Lvrbfbbi5QwARwxp20yZgAqfVbSuJ
         mPe56/CBNno0Skgvq8W1i4M56t9L/0f8+H9fD3zMefbN1i2tcLQRCFBIrDYmr57VQxNn
         bdo1gVk/lSUeCxo5qoyMblbrfUvpL8YFsPP7wY3/Q+EPDSEFQv/bS2EY7/6xXK3z8Cjf
         f/E6QHceBhfl7xdc3Otkg66aTC/iqnqgcRKL/bCwLs44v6R5MQ99GGOCQllemw3k8zAz
         1fZf3wxkGxlZ2ryOK21bPwWbY7zKx17YaHh/w2HJ7/6ptdG/PcIDMLgzfFiau/9pSwTa
         xHjg==
X-Forwarded-Encrypted: i=1; AFNElJ99+EMGispFs1Wkw2RjzjTewyZSpuVkBBI5BG49GvcS8RaM/XObV+jRnb+VljuurWMjwCtcQGZC/xoY@vger.kernel.org
X-Gm-Message-State: AOJu0YynQMX43vC40ZAR/xxU1BIPLSBA2OEKxbzqF+I4U17OKsLSYC5O
	u2zW+kCV44G2IIo+pyCLMVqu2MUgFsdrxkpR1mLpOJ9uJHXxXYguKQP2dJn3yqlzomPEMmgfG5n
	qE7NANngHyjlC2U/cIi1yOg7cQrRdNTo=
X-Gm-Gg: Acq92OFh4f+EeZXV0w6Y0Ze06O18ljRRnpYJ8Ku5LlLiSZ8TvhEhh/wradJNuBEEX0q
	+vISNhmY6PnjrgSh+bJXKxRRW+7d7NMKPmfzULqMAoQ8yY4ldDaaDSEyiCMGUKwoXaGFVSnth/V
	cizEcBsPHybPhPEF8ACgsm4tOeYYeIoi1X4tAn02pFeav1g+BHLWYBzGtyofgS7afU2TUABIgDb
	KsBgySawseVMMw7Cxr3Q8sJcjMa1adv08vJIQlV+uqtWm5xh1X6HlDBnXBr1vzGcZP7EcxpJeBy
	iGVp1nxOF9BW3pqTER7l0XqYX2P9E+/FtPuqmmPsPXoetx3+/8I3SiIaxxmgmlOSvJ/XNFopyFc
	DAQr7RjU/66pR6ahVWQXATLywD915kdDBOKeroi7zowrGFXn3+B4I7KEFK4I=
X-Received: by 2002:a05:690e:d02:b0:64e:f106:60ea with SMTP id
 956f58d0204a3-65ec9938bb6mr10304651d50.44.1779601229184; Sat, 23 May 2026
 22:40:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523174440.9629-2-hardikprakash.official@gmail.com> <202605240959.Kcf1lIg4-lkp@intel.com>
In-Reply-To: <202605240959.Kcf1lIg4-lkp@intel.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Sun, 24 May 2026 11:10:17 +0530
X-Gm-Features: AVHnY4KFGm1FRMDp57VE89vJQfBy8s3Xij_f6JIE9wMxIq8ViEfXwrWfjlI0icU
Message-ID: <CANTFpSWd3ysA7qNurHFuCPmEah1dGSfDTiFJRteU08A3kHE3=w@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: kernel test robot <lkp@intel.com>
Cc: linux-i2c@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	andriy.shevchenko@intel.com, mario.limonciello@amd.com, brgl@bgdev.pl, 
	basavaraj.natikar@amd.com, linusw@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37417-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:email,01.org:url]
X-Rspamd-Queue-Id: DC12A5C177D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 23, 2026 at 23:27, Mario Limonciello wrote:
> Is patch 1 still needed with this approach?

No. Tested v6 alone (without patch 1) on a tree based on
63d2059cd665 (the commit immediately before patch 1 in Walleij's
fixes branch). Touchscreen and stylus fully functional, no arbitration
errors.

This confirms your original concern was correct -- the existing
amd_gpio_irq_enable() flow works fine once probe ordering is fixed.
Patch 1's manual IRQ restoration was only necessary because the race
prevented amd_gpio_irq_enable() from ever being called.

v6 is sufficient as a standalone fix. Patch 1 in Linus Walleij's tree
can be reverted if desired.

Also noting that the kernel test robot flagged an unused 'ret' variable
in check_child_gpioint() -- I have a fix ready and will send v7 once
the question of patch 1 is settled.

Thanks,
Hardik

On Sun, 24 May 2026 at 07:18, kernel test robot <lkp@intel.com> wrote:
>
> Hi Hardik,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 3812a9e84265a5cdd90d29fe8d97a023e91fb945]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Hardik-Prakash/i2c-designware-defer-probe-if-child-GpioInt-controllers-are-not-bound/20260524-014648
> base:   3812a9e84265a5cdd90d29fe8d97a023e91fb945
> patch link:    https://lore.kernel.org/r/20260523174440.9629-2-hardikprakash.official%40gmail.com
> patch subject: [PATCH v6 1/1] i2c: designware: defer probe if child GpioInt controllers are not bound
> config: x86_64-randconfig-001-20260524 (https://download.01.org/0day-ci/archive/20260524/202605240959.Kcf1lIg4-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240959.Kcf1lIg4-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605240959.Kcf1lIg4-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/i2c/busses/i2c-designware-platdrv.c:192:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
>      192 |         int ret;
>          |             ^
>    1 warning generated.
>
>
> vim +/ret +192 drivers/i2c/busses/i2c-designware-platdrv.c
>
>    187
>    188  static int check_child_gpioint(struct acpi_device *adev, void *data)
>    189  {
>    190          struct gpio_dep_ctx *ctx = data;
>    191          struct list_head res_list;
>  > 192          int ret;
>    193
>    194          INIT_LIST_HEAD(&res_list);
>    195
>    196          ret = acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, ctx);
>    197          acpi_dev_free_resource_list(&res_list);
>    198
>    199          if (ctx->ret < 0)
>    200                  return ctx->ret;
>    201
>    202          return 0;
>    203  }
>    204
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

