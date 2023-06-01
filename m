Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE8467196F7
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jun 2023 11:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232868AbjFAJax (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jun 2023 05:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbjFAJaw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2023 05:30:52 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B6C897
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jun 2023 02:30:51 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-52cb78647ecso275684a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jun 2023 02:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685611850; x=1688203850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o5M3UQQTD+x7s2azLIBzfavEm6TPOjO4iZXtw/rr0Mk=;
        b=fkpY4Xw8Dl+IwSF48oWXtCUbIg0TNDwbslvqVsOVj6vTn4Bpv4ll1JwraN5ita0BQb
         VHanZQuqs7FItGUhUyyqs58TqMV8M0hly6jRPlKu3JC3XOEh6JZ+nLWnFKO46qj8NTCZ
         JTY6qwU3w4r/X595BH28XvS8yy+2hnphWMf/SCo/SQ7pw9YyDzivcrTFZF6CKuFuM3mR
         iuW6nsOn9pvXYcmL6uS1pfoynpuemax5RkR11YNwLoulhkIFyO661jbmATKLhls7DoQ0
         4Z2jwyPALMcOLqo3UcOkImCUxtUesV6mANp68ykE5jECqfZ2tEJcDNyN86+77KwAdSUT
         VdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685611850; x=1688203850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5M3UQQTD+x7s2azLIBzfavEm6TPOjO4iZXtw/rr0Mk=;
        b=ePQd2Mo44gdWg/iSU/DepQXLp+1IyRFuQdH/mzTFUG8lqfyLoq08tjYdcvc3nb+GJr
         5CDS+9QeNkeSFAgUi6FvVOPErr2x+1MHVZcMxJXD3Blif9rwUfH1s+H8KiAwMFcWRBEl
         P3VM74Qsgb1WT3FeqX8vV/56mnbUZpM/RHdcjnX6V9ZkyXA1Alf8VimC1zLou13Y1QG4
         B6OJDJ7M2Jg44HAJFsc3nRe915bJGmcgX4GB+1di/k5gvyZ7MJbDHgVSs46IabnyhnDu
         NNwBJUhKyrAcHp2viVa6q/eOAC8K3O817GwacoXWdc7JYv50muXzbguITRoRAtt9E5Cb
         uxrw==
X-Gm-Message-State: AC+VfDy8nqqWt9KVgy6NnMaAGOr6fngRGfEWfzvb19rn0XPl7vlYJdwF
        KmIIIdx1dw4XuGZROMZ0P3gijw==
X-Google-Smtp-Source: ACHHUZ5BWQSnTyd/uJtynpdiZDLMPMDoK+Nd7+IX9KgtLvK2SXGT3oVnFs9YigIiEfKnBiYpLy0bwg==
X-Received: by 2002:a17:902:e809:b0:1a5:22a:165c with SMTP id u9-20020a170902e80900b001a5022a165cmr6024170plg.0.1685611850596;
        Thu, 01 Jun 2023 02:30:50 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id i11-20020a170902c94b00b001ab1cdb41d6sm2945304pla.235.2023.06.01.02.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 02:30:50 -0700 (PDT)
Date:   Thu, 1 Jun 2023 15:00:48 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Linux-GPIO <linux-gpio@vger.kernel.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: Publishing libgpiod-sys and libgpiod to crates.io
Message-ID: <20230601093048.eqwxmkyesycb54pi@vireshk-i7>
References: <CT0CRWOTJIEO.20BGIDMLFM0E8@fedora>
 <CACMJSes5+vT=NBqSe7xpSEPAEMmkgrZvJ8iKx7oBCKZQaGB_rg@mail.gmail.com>
 <CT0N67TFERNZ.29590E8F8K2JR@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CT0N67TFERNZ.29590E8F8K2JR@fedora>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 31-05-23, 19:33, Erik Schilling wrote:
> Viresh: Shall we spread the load? I am happy to set everything up.
> But it would be good to have someone else on the list who is using the
> bindings actively. :)

Please go ahead :)

-- 
viresh
