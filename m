Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34BF17482C7
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jul 2023 13:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231417AbjGELPS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jul 2023 07:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjGELPR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jul 2023 07:15:17 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18AA3FB
        for <linux-gpio@vger.kernel.org>; Wed,  5 Jul 2023 04:15:16 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3a37909a64eso4333019b6e.1
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jul 2023 04:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688555715; x=1691147715;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lqAPbacPSaik4aigF+6eFaR4LK5F77tuwOAj3RW40qU=;
        b=T7i32OfGxZ/dG2lZ5iTfuvyOUeD5QwhA53TOblrc2bvW4IOU8vF7lrC4eWSwzPTShk
         rsVLZN8QOA98m91qD7GPnssFlTDQpfO4/8PvPoYCqv4YX7fqEXn4Nluosc1scfbfNtUZ
         I63Jet1niV7b8iN9PYsY/u9xo5pVe44dZYg66EhPSf9CWp046x3JatPgzfGv+1f+KOcZ
         /Kmdak0xpJfC1OTYqTlnDMD5+a3FPNNKNtkbhzbnhUcAzxeF3uDohxiUbLZzw/1fTDeE
         BOPOcwLvlGYJQ5Dywm6sPOM799lJGhi4J08bwb4Uu3i3q6v/AiI4docpxFZzVnLjb7wn
         EWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688555715; x=1691147715;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lqAPbacPSaik4aigF+6eFaR4LK5F77tuwOAj3RW40qU=;
        b=MJLWyiU+8hi4U1tXuUSwi2E7gl7UdFTJIW90AYh91GOeo6L49DFdV5yC/x0jMTRP5u
         JZMRdBQkuSLskQK1AwsMtKLp+huI3XPJAkWOr5qpzth7UwA9HF1hwlXo6wT3SPATXKRz
         7TE9fuJQzIp74XHApoy4WaGPTROabtmD72+0i4A5FLkQVjB9H29gEyDlQzGRkQh9ifTf
         nj4neVMDWLT2qsqnIQrzPy+WYDecl73TPgoHAU9AQmWo4wl1Gg8CSXD0kfTCGI0Pheim
         yIq0khzkix8W7ctKUdE5wBRnvmq/P4RyXi2AVirLC/tXMQzdBe3ykmLCQA6+yu5WdoC6
         5N8A==
X-Gm-Message-State: AC+VfDxMdf9YDgwaMnu/vCJoDrH+0o/9edUu9WGpOzSxpX8GGG0jDOFa
        HBn00E5NaRPTYU/E0Dob1wQ=
X-Google-Smtp-Source: ACHHUZ7XVgwUq2WskpYXT17ekrogsYCJK/ch2TWBSW0BiKZsML5h9PyBgQCt9YPqMM0NGnLBSXbHgA==
X-Received: by 2002:a05:6808:209d:b0:39a:bd0e:449 with SMTP id s29-20020a056808209d00b0039abd0e0449mr18214934oiw.26.1688555715017;
        Wed, 05 Jul 2023 04:15:15 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id y18-20020aa78552000000b0063f1a1e3003sm14376258pfn.166.2023.07.05.04.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 04:15:14 -0700 (PDT)
Date:   Wed, 5 Jul 2023 19:15:10 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Martin =?iso-8859-1?Q?Schr=F6der?= <martin.schroeder78@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] libgpiod and conan 2.0 recipe
Message-ID: <ZKVQvl0tU6dbFvSr@sol>
References: <a544afbc-5821-26d0-239e-b46a990ff0a0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a544afbc-5821-26d0-239e-b46a990ff0a0@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 05, 2023 at 09:51:09AM +0200, Martin Schröder wrote:
> Dear developers,
> 
> 
> i am trying to use the lib in my tiny project; but in conjuction with conan
> i get the following error:
> 
> *********************************************************
> Recipe 'libgpiod/1.6.3' seems broken.
> It is possible that this recipe is not Conan 2.0 ready
> If the recipe comes from ConanCenter check: https://conan.io/cci-v2.html
> If it is your recipe, check if it is updated to 2.0
> *********************************************************
> 
> ERROR: Package 'libgpiod/1.6.3' not resolved: libgpiod/1.6.3: Cannot load
> recipe.
> Error loading conanfile at
> '/home/martin/.conan2/p/libgpf99e3cc2c7d92/e/conanfile.py': Unable to load
> conanfile in /home/martin/.conan2/p/libgpf99e3cc2c7d92/e/conanfile.py
>  File "<frozen importlib._bootstrap_external>", line 883, in exec_module
>  File "<frozen importlib._bootstrap>", line 241, in
> _call_with_frames_removed
>  File "/home/martin/.conan2/p/libgpf99e3cc2c7d92/e/conanfile.py", line 1, in
> <module>
>    from conans import ConanFile, tools, AutoToolsBuildEnvironment
> ImportError: cannot import name 'ConanFile' from 'conans'
> (/home/martin/.local/lib/python3.10/site-packages/conans/__init__.py)
> .
> 
> What can I do to fix this?
> 

Hi Martin,

That recipe is provided by the conan project themselves, not libgpiod,
so you should take it up with them.

FWIW, it appears the recipe is in the process of being updated to support
v2[1].
Perhaps try their WIP recipe, and if it doesn't work then follow up in
that issue?

Cheers,
Kent.

[1] https://github.com/conan-io/conan-center-index/pull/18171
