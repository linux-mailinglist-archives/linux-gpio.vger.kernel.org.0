Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 641C86056D0
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Oct 2022 07:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbiJTFeI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Oct 2022 01:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiJTFeH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Oct 2022 01:34:07 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA99114DDC
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 22:34:06 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id h13so19296525pfr.7
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 22:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=buwIZKEfEklE5QCp1QFmB/toipGpJo0bBeY6Yg3qsfM=;
        b=IIlyOlWFM5c/SY00XZTWUopLuKiiF2qHrNfH//G3P2mh1Uwmkwi9+gIyKIlYBNf44V
         1bRgDMrTXZo7ZPg/1ZUOgcZLozra8XNAMptj1PN8C6OdFC6zq8eZJDs89OmiAW0B08f1
         +QJWbnqx/i9Zbtm1TWbBDoUHjuVGN+BkzTrvVuzWT6f3eJeiOB/OC9Db2vZau0/8TTNY
         q8cT7KX+E5X/Zg2sviQbq4AkTvGGvnuniV46L55zQKIVXDtLAGeqQttthADLCotpOwES
         8QcKSoLklRB4z4f6yF6qMVz3MTaV7x1zTsO1Dc5CYd1uDXWH+lzW6QENoCVByij575e/
         SBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buwIZKEfEklE5QCp1QFmB/toipGpJo0bBeY6Yg3qsfM=;
        b=SkmG1L3deV2xSvkd7xKqTj019sN/QxyHerDj4y7H2zifMn/MAHPIZOOaUEVj9DLxxg
         ddl8r8tMnKNPUNCvbYFJFhDQ54kpeuWWs9FF6dUUrsgSO4CSlFkB6exaOOXzDitrjrVl
         JV/oUua6Ld+9zqa2Z+43I1pMJl813XntYGWz/J7zKt257Ly0o9s7Bw46cUaTONBkaSQb
         v9QrcxfOkWq1WODGBIJWG1nll9FyFKFU0OVqsogxvLgNdmAg+3L+s1JTqknbBlD885R7
         k3R0i5959cxxnHhyLmT9VQvUCO/4ROukL+6eg+B3WyhheV58m3wzCjJQEt/t96v1xGEe
         Rycw==
X-Gm-Message-State: ACrzQf0lLmSQAm1G2qddXkkjp1ehfLJB3ZsVnLRjBWqfu5VESMYOa2t7
        2lLM8vA4ShCBcrI13j5g9M50nQ==
X-Google-Smtp-Source: AMsMyM5v9ZDKjiWIPrnRlp5VYLh0Li/BJoMjniqaAb3tjvW16TB+0nPmj9whsFzUpRmQc9WRdHTGtA==
X-Received: by 2002:a63:1521:0:b0:43c:9566:7a6a with SMTP id v33-20020a631521000000b0043c95667a6amr10331883pgl.339.1666244045977;
        Wed, 19 Oct 2022 22:34:05 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id q6-20020a170902dac600b0018542a1b553sm11537651plx.127.2022.10.19.22.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 22:34:05 -0700 (PDT)
Date:   Thu, 20 Oct 2022 11:04:03 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V7 1/8] libgpiod: Add libgpiod-sys rust crate
Message-ID: <20221020053403.3yvs7wrx7s65g4bh@vireshk-i7>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <c8ef89c343a0c31e4132cc6757fdff8dec0d1669.1665744170.git.viresh.kumar@linaro.org>
 <Y01RqjgZINnkcyIC@sol>
 <20221018112204.l36wnimrqvexnvat@vireshk-i7>
 <Y06S5GCFYeaPEW9E@sol>
 <20221019064612.p4gu33dm65rnjwl6@vireshk-i7>
 <Y0+lZ9qcNGX1Q/Of@sol>
 <20221019112251.oyfek3gjodyt67lh@vireshk-i7>
 <Y0/nNRu0OOXXfq/h@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0/nNRu0OOXXfq/h@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19-10-22, 20:01, Kent Gibson wrote:
> I was assuming it was an interim solution, so it doesn't matter so much.
> 
> I'd be happy with docs.rs once libgpiod v2 is released and the bindings
> published to crates.io, and I'm personally good with looking at the
> generated docs locally in the meantime.

I do plan to publish them to crates.io.

> It would be easier for others to take a look if the docs were hosted,
> but I don't have any feel as to whether that is worth the effort or not.

Lets get the code merge without the docs published, we can always come
back and publish the documentation somewhere once we are sure where to
publish them, if it is really needed since we are going to migrate to
docs.rs anyway..

-- 
viresh
