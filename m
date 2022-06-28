Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 432C755E711
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 18:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240696AbiF1OKB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 10:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231435AbiF1OKB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 10:10:01 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D533587C
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 07:10:00 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-317741c86fdso118395897b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 07:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BU/IDUxXLTGFY20zp82vJFbU25b/Q168KB0wOqs4ZkQ=;
        b=TXxFjrNvO9VchIPwytsio/j+Qp7P80EWO3VpEWfjOcMuRrZO3TOeSZdOYut6fVXkP9
         Br2TvVTIO82S5VbGrWL1TcQXVL9FytLbeB8XDsn+faTWBLG0sFP7E3redrO7g8GU/asu
         FA03xfpp3YGGcbeC8/iHmzpCujF/74fR8ZE9Djfv/WXAVTGqFXlLmALr0joTjsvF+6gq
         jL9rYFfwz1QSjHUCfj3sJjmYiIgJtENY4knais5Anp9g3jwrRJ9wx5NW8eM8BhNWY+nC
         zizxmhlcUnYZ0m1akP9A2MQDW0TbtLWL946RMoL1oGXjNMnRlGHnT4TWxXKpWAkgOmV2
         tZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BU/IDUxXLTGFY20zp82vJFbU25b/Q168KB0wOqs4ZkQ=;
        b=025vv6Lcih1AnmV5g0sTEZ8rq2sotjmwSg3dgfHhDwhzLt/YS1bO3QJQFK0p3/IPBh
         CltKIyo5uCUcCOo2uuoFRNIcnZ4+18Uzk0VI2JdbQPGy/QiGoMgUrijRld13EC39Kpr4
         8I6ZtBYYFRTKRLEiETQvedWlyo1YjYJ5ltaTkZL9biI6AZMgyI4uKR9jgQC6P7ysoa4T
         r/scaHUUvw6ias9xOuP/nef1TXaVoW2vSQhbuR1Oolu0LlK6a8qT1T47OE1f0TEc4sZ/
         tyjzqQr5ks3LrdAnIX/tzccQm0pPZjbx8KjVsNEkPrBDrVDn0ra2uB/kvfH3TnLeFNTU
         Prmg==
X-Gm-Message-State: AJIora/EO67ILp+RBnyejUyuf1YHOIfdm6nZwiNF84fvBkhvBYYub7YC
        zMY4J4QHEeBEzRBgrTOuOFDO7lwFX9vKp0g7h2OQvgOE8qs=
X-Google-Smtp-Source: AGRyM1v/XBqba54NNrJu6tK0BY1yIm0LIoGofnP8HbwwTZ8vAsy+I/hF6qk5BvHUbCF0ZbE8uihWemMKyVj8qs96oSA=
X-Received: by 2002:a81:6587:0:b0:318:38c2:2fb1 with SMTP id
 z129-20020a816587000000b0031838c22fb1mr21833224ywb.118.1656425399521; Tue, 28
 Jun 2022 07:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220627092425.98730-1-linus.walleij@linaro.org> <fda47a80-605e-ee39-d7a0-d48d40fc8840@quicinc.com>
In-Reply-To: <fda47a80-605e-ee39-d7a0-d48d40fc8840@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jun 2022 16:09:48 +0200
Message-ID: <CACRpkdYwc33k1U9RpFpy4L+9fAqkCb=uOWG8gyBTC-m865wYBQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sc7280: Fix compile bug
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     linux-gpio@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 27, 2022 at 11:30 AM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:
> On 6/27/2022 2:54 PM, Linus Walleij wrote:
> Thanks for Your Support Linus.

> > The idea was right but the code was breaking in next.
> > I assume some unstaged commit was involed. Fix it up.
> >
> > Cc: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> > Cc: Stephen Boyd <swboyd@chromium.org>
> > Fixes: 36fe26843d6d ("pinctrl: qcom: sc7280: Add clock optional check for ADSP bypass targets")
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
(...)

> There is another problem with this patch.  As lpi_pinctrl_variant_data
> is const type,  unable to update this variable.

Ooops

> So I have posted the fix patch series v5. Please check and let me me if
> anything to be done.

I have already pulled other changes on top so I would have to revert
the patches, can you inspect what is on my "devel" branch and
just send a fixup patch on top?

Yours,
Linus Walleij
