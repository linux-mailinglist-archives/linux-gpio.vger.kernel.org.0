Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCA55823CB
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 12:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbiG0KGi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 06:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbiG0KGh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 06:06:37 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD123B1C2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 03:06:36 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id a8-20020a17090a8c0800b001f30e4c002bso906751pjo.5
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 03:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=47RGljeCAbs0daEzLAtPboGrL853nvVuCghiH9sDtt0=;
        b=Q71zKZO5hy5Jj9FHEDMz16Er1Iu+9e4Ztb2306yYGoFn6ZD2Y6zQErsKOesbJ7Nq42
         XpkrR0GFCQF1ksFsA9BUtnh5phiDwJYfoXV6h1yiLeytB6/Hn1FJka92j9EbT93hr4as
         5i8Q8H+u/qYowNMp/xFj6JW9ZszoVG44d4u85GIjenlR2iMBTL0HcFXh+Om2iPaKf57q
         u1j4yPbGoABrYQl1C0BfPRqpFuhJB6QfE2PJi+3wWUKgdCE1ZYjCck55k0CHcU3SH3fA
         /phYMO0A7KwM/SmLJZ8Y8Hl7O+jknZAPOXfAws3lqblbn2I/Gakpk0MwC8/rhLstxRBv
         Ezsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=47RGljeCAbs0daEzLAtPboGrL853nvVuCghiH9sDtt0=;
        b=VPdseWvJLK+OkNtfndQ9DMbbvzEtVOGRSP/PEINoW4Nj6YEcRD6r7m1Gr7U5ZYy4/T
         am50XQI6lDUe9XbSvmuUjEkRRGBnhXidjvHLhiZlqhWuj/FXHAOIu/g01dTgug4w7EQY
         y4V66+7uhBxprBoGqwTTKDQK3RZBynsR7o6kPhtoJjORVKLz3zwO8n3a7X59nKWzisZZ
         eed9y7TKSSTsn78X5zjYZY+L9A2cGc4n2LWcXkA7ILf6omGwc2Z81/CrWUBy1nI8VNas
         ipKvLw7k80mNEKjkNdiOR6I6kdav33HARwlIB2ShODJRh4rHsZVWU6SMh6xnNbikgGsK
         Y+mA==
X-Gm-Message-State: AJIora86AM66xrextppaP3L5/wk9XmF07UQqDi6OSlWiK2RyVFpEVsOZ
        isgwHstT5YPOjDf5dCa3dkWzDg==
X-Google-Smtp-Source: AGRyM1vtEP2Nb4H+JN9HLJdA3wOm4/quqcywIYhoelXnncHdbbBYRAhySGD1X1rGEGq5Cp9TNavQbQ==
X-Received: by 2002:a17:90a:e7c4:b0:1f2:9645:e0df with SMTP id kb4-20020a17090ae7c400b001f29645e0dfmr3782612pjb.77.1658916396186;
        Wed, 27 Jul 2022 03:06:36 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b0016db774e702sm848936pli.93.2022.07.27.03.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 03:06:35 -0700 (PDT)
Date:   Wed, 27 Jul 2022 15:36:33 +0530
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
Subject: Re: [PATCH V4 5/8] libgpiod: Add rust examples
Message-ID: <20220727100633.4hrldpruyhblxobw@vireshk-i7>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <acd12e70cfb30f04761f3c2efc868ec138c90c63.1657279685.git.viresh.kumar@linaro.org>
 <20220727025815.GE88787@sol>
 <20220727092319.hwblcns4zcfbi4kk@vireshk-i7>
 <20220727095945.GA117252@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727095945.GA117252@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27-07-22, 17:59, Kent Gibson wrote:
> For long enough for the user to check that the line is set, as there is
> the possibility that when the line is released it will be set back to
> its default value and you will get users reporting that your set
> doesn't work ;-).
> 
> So wait for a keypress?

I thought we wanted to avoid human-intervention to the tests :)

Can't we just read the values of the lines again here somehow and match ? I
don't expect/want the user to do this for running the test. Not to mention, the
user may eventually be a bot running the tests for each commit added to the
tree.

-- 
viresh
