Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 237BA605E61
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Oct 2022 13:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbiJTLCZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Oct 2022 07:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231158AbiJTLCY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Oct 2022 07:02:24 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6DAB1CC3E4
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 04:02:22 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id b5so18880763pgb.6
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 04:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FAw0ORHr9ouo+0QY+UE8Xupww1UKzfKp67gX7A93YUU=;
        b=bx6KvRBi1bmhztGwQVpsuua+mSP7Fzp9xXdGqk7D1/BahpavCMRHdB8PwW+jzVMjCk
         lErkqeCnoWSSeeN55gKL8yhdscOi2/cSnakw59gTfDGyLCX43xOFupI3KzEX7L7LZ9w7
         m+PADJN3DgtnNt4wndACSn8Jy43djrxDeoSKMEjQ+Wc6RgWr4yaHHRyXpqIMS2z2lLK5
         bSnQT+qkRjHbLzGPUKdkdEmrb+XKYBdJpEVile8slK5pVlr9Ymcr39RpHGejwB7EFpmy
         hysGlNoTe3nMqTAdVOXwrynJpujpDrH1qSf+Y8zgLTnxNacQ0YQ+XtYyDd7hBxUCxKyd
         vSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAw0ORHr9ouo+0QY+UE8Xupww1UKzfKp67gX7A93YUU=;
        b=LDqCHK54tNmKRoCuyb7OYdzWGNz2EpWwBxTZQDxo+yp1bh53YHkozapbMbdM3fkttz
         DvTkrZsYrl9YmTspeCa2EoRB6Pz9b80k9ELbp8smZa8Q4n3fOlQzbxTOUjL0Vqpm3zNO
         hkuVuZNFsqdTsy9eZOV3fsA/LdklqQpW4lijKn0dHlVA8fHlcV3iUU+zPzDVmdqMphIP
         9nk1Ip9t6wDBcMP8PUvMhz+BIVP8evHKfczclnoAwVUNK0KSUITpmnSMr70E2HpxcKt/
         6fvTw5Qk65xSPoZ/zQKsDQ3e5cPijW/az9KjMgJvJ5eQWv6I3Dyrdk/u/9CHsoMQXBC9
         vWow==
X-Gm-Message-State: ACrzQf3dRgedc3fLIzVLclEq4Q/950VG3dj69or+1w9knVXnfz8sLnOf
        wEgu8qasy4HHZzCNiPZw5ko=
X-Google-Smtp-Source: AMsMyM4dcTrXoMNajoqgPRhgz/hUwpNeRwQSACnTzdqdq+XJvfz8bno1qLZ5/651XOC6wZbRMBltzg==
X-Received: by 2002:a63:81c8:0:b0:462:953a:8534 with SMTP id t191-20020a6381c8000000b00462953a8534mr11065450pgd.69.1666263741371;
        Thu, 20 Oct 2022 04:02:21 -0700 (PDT)
Received: from sol (14-203-42-90.tpgi.com.au. [14.203.42.90])
        by smtp.gmail.com with ESMTPSA id z188-20020a6233c5000000b00561c3ec5346sm13074691pfz.129.2022.10.20.04.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 04:02:20 -0700 (PDT)
Date:   Thu, 20 Oct 2022 19:02:14 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V7 7/8] libgpiod: Add rust tests
Message-ID: <Y1Eqtso+7MQhNmMe@sol>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <b609b421bf39ada7a1e4460e10a201a318be7a28.1665744170.git.viresh.kumar@linaro.org>
 <Y01R+58inH5MgXl7@sol>
 <20221020103741.vdo5xwrjgqmfizbx@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020103741.vdo5xwrjgqmfizbx@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 20, 2022 at 04:07:41PM +0530, Viresh Kumar wrote:
> On 17-10-22, 21:00, Kent Gibson wrote:
> > I was surprised to find HTE tests passing on a kernel without CONFIG_HTE.
> > I take that as being a kernel bug (GPIO_V2_LINE_VALID_FLAGS includes the
> > HTE flag unconditionally - which is wrong IMHO).
> > 
> > You probably shouldn't assume HTE works - unless you have a system that
> > supports HTE.
> 
> Should I drop them ? Or run them conditionally ?  How ?
> 

The Rust test framework is pretty simple, so there is no way to
conditionally skip tests, AFAIAA.  And the only generic way to tell if
your kernel supports HTE without probing it, which makes testing it
pointless.
So I don't see any alternative but to drop them.

Though I would be happy to learn otherwise.

Cheers,
Kent.

