Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DACAB7123A5
	for <lists+linux-gpio@lfdr.de>; Fri, 26 May 2023 11:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242548AbjEZJb4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 May 2023 05:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233330AbjEZJb4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 May 2023 05:31:56 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45790B3
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 02:31:53 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b01aa5526fso1025885ad.2
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 02:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685093513; x=1687685513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bdlAeDm22pBQczDYxriGGQG3NLmCGDFGh3GtkukeIaE=;
        b=arvL09wtFZMjTANzU9Tz+pRkyj9dVZZmeu+V38TRm08czy044Gq/puyfLybiKPK6JX
         WOqMgnT+54lpzdynrzdooJIxGNn1nK+HukVhYCfVbResJIQoL5c2ayrRBfwF1wWpLTFt
         lH5QvfzB/vukAoZo9fHDcVlRaIcDNt3PfPXLLJQw3uinWIC6mU/gLtFiL/R3s8YpRz8l
         5zOqBM6T9JqNqvnh6Qu0D0aq+Tm/NmpIE6g5XFil9hH4+R5lZj4xljd0tlVMThXTofU+
         j7HyLcEbIvIDPyqRsaeEu7L5KsSmxshooA3O+cOyUWa7YGVm90T8YUmb2QTXW/DCOcqJ
         aMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685093513; x=1687685513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdlAeDm22pBQczDYxriGGQG3NLmCGDFGh3GtkukeIaE=;
        b=JFwtbjcFZV8yq77N3Y92/xFVDLM0LGFr1kMHd1gIm/GuEo3D7YF2bbShk0GF3BfN+p
         +t/Hvbk2b2C/Yik4N76cNPjnCszknalWdCMb0k2v9Mc8IKYnkxaCbMLFa1VwvDFFPcqI
         0vtt6Pvd4b063BFESyBIYvAAOxRAteOdvpLWC+q4Y+uIfcrXTvF38oD7cxC5/5Aq36XJ
         RlPXY8e8XkgFhzVcpbZ3uVShmOSUi43uR45jacJJLIAvUbxxls+NoVB1LYNxhsIi/Ra0
         ylt/g/yBzMilV3phIxUTFTHdHiVOd0agUyxlnmWmdzxDpSigK7cV3XJ70l+uWmg+D49W
         7Pyw==
X-Gm-Message-State: AC+VfDxjqTnpZTHXvUbbndkSoIyOCvfsWrHpaF1b+yjiZggvvRGqgs4a
        koKew2z5+lR6A3vjF9QQjNmvjsH1yQOWv75Zc1k=
X-Google-Smtp-Source: ACHHUZ4gVZOy82/dMIhE/56Lh/NQRy3+EOOi4nyxFey6GbaoOegZ0M/bbudPud/0vx2fCziRqYyYNg==
X-Received: by 2002:a17:902:d2c3:b0:1b0:348:2498 with SMTP id n3-20020a170902d2c300b001b003482498mr2107778plc.2.1685093512751;
        Fri, 26 May 2023 02:31:52 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id jh11-20020a170903328b00b001ab1d23c44bsm2827089plb.181.2023.05.26.02.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 02:31:52 -0700 (PDT)
Date:   Fri, 26 May 2023 15:01:50 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH libgpiod RFC 0/3] bindings: rust: allow packaging of
 libgpiod-sys
Message-ID: <20230526093150.5znk6hdxzhhezuhc@vireshk-i7>
References: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
 <20230524060341.khmsd2lw32u3jxsc@vireshk-i7>
 <CSUCSUR6CSH3.NHT0430XGAIO@fedora>
 <20230524081454.ztcywdhjgw6axvjw@vireshk-i7>
 <5f782ccd-ccff-67f8-22cf-7b9b1c7e2e3a@linaro.org>
 <1b9968c1-77f3-6525-af57-a6c7808adb59@linaro.org>
 <CACMJSevb+-eCe+PPaY-=bXx=5t7+sg8BT+9ZYO=t=OzC3hmwHQ@mail.gmail.com>
 <c561cadf-50bb-a42b-5454-610179bdb1ee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c561cadf-50bb-a42b-5454-610179bdb1ee@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 26-05-23, 10:59, Erik Schilling wrote:
> @Viresh: Could you comment on the use-case that you had in mind with gpiosim
> being on crates.io? I am not seeing any good options to package it if it is
> only intended as an testing tool for in-tree things.

I thought vhost-device is already using it for testing, I was wrong :(

So we don't need it via crates.io for now at least.

-- 
viresh
