Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F98B74393D
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 12:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjF3KTx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 06:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjF3KTw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 06:19:52 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416041FE7
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 03:19:51 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5533c545786so1067576a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 03:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688120391; x=1690712391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JiiZuwlQSw2QvvwEY8A12ijk7Yo9neFx0fYNwWP4cRg=;
        b=pdHkmxur9ta/A3WUN3+32AHNGfMSuZekV0/94XKAQH4QGzMt9/qQ6ohR2o/c/jFK+A
         bONW24ggzVIMaI2tobcUqi3yG/+DUJ3HomqgTojLHPq+iP7I61+Pk0iTJWT/eEAtcWj7
         UNM4wzobZ//ybX/0gpDN8SrFSwjICYk9SpqZAVEzm4T+K10HMrNi4C4cMEX/4j3mryeU
         uwQNkejkrvythUBOakOlmntVULmV5+Ik+QWu6JQgVBkasbawIHf1GD0T5aoamwPY5LLk
         rpLr6EululqSrQKcwOmZr1LBMjtsQLlWwX/F9efyhZGn2yWylhZvyblwSWDVAkTtDqT6
         EqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688120391; x=1690712391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiiZuwlQSw2QvvwEY8A12ijk7Yo9neFx0fYNwWP4cRg=;
        b=Vw62Y64KwB0vn9A8Ay4UgKzU++01Fb8VjYBbdOE/yPpFvI4ciPwcxQpu19hBcZ4cTz
         HbIfKunMP8qfUtYgl8FTtMtrv+O//1+SUXmSP/uXjpYPQJQsfFUt48bDLg6hEAPR3cdD
         88/gjQ1wv3deC+y7+CgAIiC68l9T8sxDtw56mxViuB5d9pWOLzsl4D0HYaDRsrYOas9c
         8bRHQTwKNIjlw8b24vD8jRm3soIo9kzdM72nMtOvh2f7c5Td/7wQfxSYEC4GcWjSeQGq
         8zGe+GxKmH1uCrHr5CuQMucPcdpflClv2zaNjM6BllO9yQX+KfG3T7VpucwltvANLMcL
         4i5g==
X-Gm-Message-State: AC+VfDyvlGoqAzxGbTaVCHK7uOgtdrML2ALf8OgaDUAQLNgFVQZsBvXb
        ACndLCjqZrz2rQ7JvdfofQIVa0hd9qQ=
X-Google-Smtp-Source: ACHHUZ44SJ7m7r5vJBEW4yFB2CtHPgpfQbXNfKQ4ztnhiQrA2U5ogtAQM+ABCTQOHwABeaNA6MB0jA==
X-Received: by 2002:a05:6a20:1612:b0:11d:9249:170e with SMTP id l18-20020a056a20161200b0011d9249170emr3087448pzj.12.1688120390594;
        Fri, 30 Jun 2023 03:19:50 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id i18-20020aa787d2000000b0066e7a540e9csm9331723pfo.140.2023.06.30.03.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 03:19:49 -0700 (PDT)
Date:   Fri, 30 Jun 2023 18:19:45 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH libgpiod 4/4] bindings: rust: clippy: silence
 false-positive on iterator
Message-ID: <ZJ6sQYctu9mHqQP5@sol>
References: <20230629-clippy-v1-0-9ff088713c54@linaro.org>
 <20230629-clippy-v1-4-9ff088713c54@linaro.org>
 <ZJ6bd8+oDbyX06rp@sol>
 <CTPWFHFJNFFA.2SGA858S5QIJ5@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CTPWFHFJNFFA.2SGA858S5QIJ5@fedora>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 30, 2023 at 12:05:28PM +0200, Erik Schilling wrote:
> On Fri Jun 30, 2023 at 11:08 AM CEST, Kent Gibson wrote:
> >
> 
> > (I am seeing this one test failure on arm32, but that doesn't seem to be related
> > to this patch:
> > ---- request_config::verify::default stdout ----
> > thread 'main' panicked at 'assertion failed: `(left == right)`
> >   left: `OperationFailed(RequestConfigGetConsumer, Errno { code: 2, description: Some("No such file or directory") })`,
> >  right: `OperationFailed(RequestConfigGetConsumer, Errno { code: 0, description: Some("Success") })`', libgpiod/tests/request_config.rs:18:13
> > note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
> >
> > Not sure if that is a genuine bug or something funky in my build.)
> 
> Is the GPIO_SIM module loaded? Did you test with a custom kernel or
> some distro that ships with it?
> 

That is the only test failing out of the whole suite, so gpiosim is not
the problem.

That is with the latest from the Raspberry Pi rpi-6.4.y branch[1]
(a867309b7a55 so a few days old now), with CONFIG_GPIO_SIM so that I can
run the tests.
Happens to be running on a Pi ZeroW, but I don't think that test is speed
sensitive.  I have done a complete rebuild - same result.

Are there any distos enabling GPIO_SIM yet?

Cheers,
Kent.

[1] https://github.com/raspberrypi/linux
