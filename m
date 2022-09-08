Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 744375B1CE4
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 14:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231723AbiIHMZs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 08:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbiIHMZq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 08:25:46 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B6ABC6500
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 05:25:44 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id a70so7956942edf.10
        for <linux-gpio@vger.kernel.org>; Thu, 08 Sep 2022 05:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=NvItkbNfICcu7g1yVv4WgDTot4PnGzFSFa7/RC5e9pw=;
        b=BqBdZOd1Iq5VKB5wOE7GYtx+R/htdT8tJs61gZ48R6LiLkBHqS3GYp7/3R5IN9JPxQ
         TExYh3bomSJkoM1qQY6rq4cA2DBNBpxc3IiOtxopwgeLzUs+EYAoaMb7JVXEp4UIwNRv
         8UcF/vC/Kn2YbOCQwwjmNA8H4vTnJKbhauT6CgmM+rU9fI/bS45HgWMQUDXfK+HavJhC
         ZeRrl+P8mmZWh4sIPWn6v2setqsvxrMY2diGh2KH7GCsG5kEWhHu/EnwOLcQWK6B7p33
         Dh6Od0GzXHg1FnmH5JZ49R8X7d9JkGULvWWxafb2FZb6GYaFWFekRwd7gY5uHcmBv/qS
         9teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=NvItkbNfICcu7g1yVv4WgDTot4PnGzFSFa7/RC5e9pw=;
        b=glfm1ujCp40oJvN3CtSbZdnee3OxqvyRPEqxBRafqUNvesohcmXzVkRpF2NfvUGQec
         kTcl26SYeUb/QVKOJrEDhuqhFVXr5E4kyygcGmVFz/hNrf0oqeFAdy+IwknD91kJ+hn9
         0CABx3/5lnglIsQOVQCr73IgIuKNH+SIaTovnSA2GNHi97784E+miPPLQ1xXsnbkUlC4
         mMTl0ukvyyLjzRBzohLqD9p0pO4zDjzaLdE/+sbLH6iYFOGeYm4mDqA/iQuvU3n9SLDE
         yIZufTcWpBB/1hj+xa4xjHx1Hp8X5jc6dsSCGjrjv27UKKmN6yznGxWUOU8UhWKdWvhl
         0xwg==
X-Gm-Message-State: ACgBeo07DuIRjY6CiTCbL5do+Y+m0OmELlN6jGB6voKoTsvgkR8yvIzi
        4k+tIhymJS1GmL+RO2pInC2xKEE6GfGa1WmrVUrXJ7/soS1IEg==
X-Google-Smtp-Source: AA6agR4wVuJKqlxz5De3pSNrkC69WW2AZaVznXq+MyCsaZdK6joVGRVpseWkWNce6A0VWt7oOOVqDsC/KDWvLV+t1a8=
X-Received: by 2002:aa7:c84f:0:b0:446:2bfb:5a63 with SMTP id
 g15-20020aa7c84f000000b004462bfb5a63mr6979030edt.172.1662639942930; Thu, 08
 Sep 2022 05:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220830092232.168561-1-manivannan.sadhasivam@linaro.org> <Yw39qmuS3T+DLcfB@hovoldconsulting.com>
In-Reply-To: <Yw39qmuS3T+DLcfB@hovoldconsulting.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Sep 2022 14:25:31 +0200
Message-ID: <CACRpkdZon4Z-bYeyA455pKRrDXshosNX7SjfF1igt+JnNyT+PA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: qcom: spmi-gpio: Make irqchip immutable
To:     Johan Hovold <johan@kernel.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        bjorn.andersson@linaro.org, robimarko@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, maz@kernel.org,
        johan+linaro@kernel.org, steev@kali.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 30, 2022 at 2:08 PM Johan Hovold <johan@kernel.org> wrote:

> > +     irq_chip_unmask_parent(data);
> > +     gpiochip_enable_irq(gc, data->hwirq);
>
> Could you set the IRQ-enabled flag before unmasking the parent here for
> symmetry (and as most other implementations do)?

I fixed this up while applying so no need to resend.

Patch applied!

Yours,
Linus Walleij
