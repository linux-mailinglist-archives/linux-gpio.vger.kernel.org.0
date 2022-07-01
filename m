Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6AD75627CB
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 02:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbiGAAml (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 20:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbiGAAmk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 20:42:40 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA8D1C112
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jun 2022 17:42:39 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id cv13so1070523pjb.4
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jun 2022 17:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zldJKwt/mf2s5vKw7e29TEq3s8dFO6nLnfjlpg00D9w=;
        b=YaEnpF0RBMKaoVTcqtY/JFySpMxbllgcvecureridxQr8555a4iUy2DtCDv4OShMzz
         Dh/xIsGzzZ9G3NNXyxbgq5BvDGBJ2YwiXjGEppQF5XlJgEs8pDZ+Drw5iSIz4znLABCH
         fTkwSRUiwGGhVwTnTXK0JUsrSr0yYhPIvfqeD0wSUBZm6jbr/Y/m7TMUL6p2lX4ho0SU
         8KYaqudTADnT2zY75/jruS8kTIlnjc75JsuoKADwRZbGIjn3k9Cb0C3oUZcxpHLV5YPu
         Cy2ZUzRlwO1B9csNXOGAbocHSaHKj8teY0wofI0/gHKaZmNVQ/l8uFK8hSNPBZcjsclm
         EutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zldJKwt/mf2s5vKw7e29TEq3s8dFO6nLnfjlpg00D9w=;
        b=HhmryTAIcnZyZOz2wgUCszFV+2xjomdXSvyWJDampcDF+3RfWRuQQwJ3VrYZ6jR2dk
         pcE0NrixnDnFdSLpjyTs3FErRygQUlO4kQgGX0bC8YzLAdpA4/WKmBM2LM53cPJwWwJj
         ZnXWHvo4T4/P945M8o2lPnToVdqahVayGF1q+oXM2N3ycLVIHywHzajxHRSUq8zItABd
         7P9yxpb2hiZd9/MFa5v+IivThVI6cv37MwxISJu9X5i8kzF0xEaNeX6ZO7jn8HdUOOvx
         vzMW+RtF3gOTDCpOV4I3lEQydR+uwkVN05CundKT8jOTvTC1219eWC6lyjolpaViBRI/
         kmBg==
X-Gm-Message-State: AJIora+zQfJLCNhGez+7/9G4bM1YyUmb9ljb+lMQbw9YYzDij/EwbL0d
        KmR34rkyvJ/zk6nA/RhPe7ts9z4ICB0=
X-Google-Smtp-Source: AGRyM1sAGnYIjHjs1Aa04AwFsR7hlfVNYN2ORuHuM2zwCyNANCN0zo3VioafopnIurQ4/N+PKQlX5w==
X-Received: by 2002:a17:90b:4d82:b0:1ef:4216:fce6 with SMTP id oj2-20020a17090b4d8200b001ef4216fce6mr5179625pjb.10.1656636159018;
        Thu, 30 Jun 2022 17:42:39 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id x6-20020a1709028ec600b001638a171558sm14049057plo.202.2022.06.30.17.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 17:42:38 -0700 (PDT)
Date:   Fri, 1 Jul 2022 08:42:34 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Subject: Re: [libgpiod v2][PATCH 2/4] tools: tests for line name focussed
 rework
Message-ID: <20220701004234.GA5471@sol>
References: <20220627134447.81927-1-warthog618@gmail.com>
 <20220627134447.81927-3-warthog618@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627134447.81927-3-warthog618@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 27, 2022 at 09:44:45PM +0800, Kent Gibson wrote:
> Rework the tools tests and expand to cover new functionality.
> 

Just reaslised the tests don't cover the symlink behaviour.

The expected behaviour is:

For bare gpiodetect and gpioinfo, symlinks in /dev are filtered out -
only actual devices are listed.

For all commands the --chip option will accept a path which is a symlink
that resolves to an actual device.  The symlink itself need not be in
/dev.

I'll extend the tests to cover that behaviour for the next patch
version.

Cheers,
Kent.
