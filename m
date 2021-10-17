Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55453430C58
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Oct 2021 23:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232509AbhJQVdi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Oct 2021 17:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232797AbhJQVdf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Oct 2021 17:33:35 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6343C061768
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 14:31:24 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id x27so62593193lfa.9
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 14:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ntVW8PJuipm3xc/vpXZTAr5dU/MMM/BZDcyD3Fbdk2U=;
        b=HPwcyCMUgBHLwXaw7O9BZHkmEgsWyaDiH9fZwnu159qLhbv1TPxeHOPI+lgsOTmNOA
         zos4lQVQ/7iLttCVYtDXOlZG2JhJJKiddkuLchusnGzgsRZzLsd/FC3uE/wrUkj7LYPj
         jlyA0Fr3GcGlOU+dWo0WGfAjIRTH7hfuqAr/4AW++qPWN+1m9tuBCnxP9/YL+kyAqQmm
         ZoNc8d9NUkwBXNru80PG2Fafr8c2jUjCuO3ooZ5hzXf396DecwqrGqPWPrQ3h0rA2tJi
         GjX9Zzj6kBPyOt4Apyji27sWuwU1lme39o+slimQ7rsLHT/fdq65TEIaY6HjAwahs+MP
         D9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ntVW8PJuipm3xc/vpXZTAr5dU/MMM/BZDcyD3Fbdk2U=;
        b=DSyv/30GIPkRx5aU2dmpOZ1fcxamH0Tok4HJBTizaEL1FFRSIKtLa6/3YcgIEmMTfQ
         IumHc+4MlmVReqN5Fg7XuwT9vm2o3xaukkPeKNadc57WF4+dfRSJe5y52KhmTKT/oIip
         9y4h87mssLVGMfBYqcl5/wg6FKaVkPqCOff+5qiTaAawzm+JUtmkFoYoFfZRL8y+644V
         /qjwUuO0RJD3SW4CzCbQOV/JmsDKji1+MOW7XFUvUSIZQHfL7uThdTBQOShrnITjZ1VC
         ow1oWTr/89hbUru09ZCfjRcUzWohOx2altEYzGEb8gW/rJ6m3eP45YnnIabOAUNxZ+uV
         PRrQ==
X-Gm-Message-State: AOAM530BAdHV7H4aHX8uZ4nPt2T6BuwN8khscYuyOH/Vt0ZBjtAbhMUk
        jLX7NojfqKhBYIR//7x9H3w0QXmLoVkhuLO76k5CoQ==
X-Google-Smtp-Source: ABdhPJwOwW6Xjrl68VsM/iBPxiOBx+eVJ8Krpm3yH9I34bR7EnITx+NNGJlvrOfuLlSuO1zymuHCiDP/yaLhIXeJCQc=
X-Received: by 2002:a05:6512:3e9:: with SMTP id n9mr26840805lfq.72.1634506283165;
 Sun, 17 Oct 2021 14:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
 <CACRpkda_hW7vbvC1jizRa05ZdgeL-FkU3_zF+rvCfRBuRB3+VQ@mail.gmail.com> <YWxVUd8eZOvZkJIy@builder.lan>
In-Reply-To: <YWxVUd8eZOvZkJIy@builder.lan>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 17 Oct 2021 23:31:11 +0200
Message-ID: <CACRpkdaptRDWfU5V+fsEMVhpyZYVv_JVFcvWkQoiUDiCwBJ1zQ@mail.gmail.com>
Subject: Re:
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 17, 2021 at 6:54 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> I like the driver changes and I'm wrapping up a second pull for the dts
> pieces in the coming few days. So if you're happy to take the driver
> patches I'll include the DT changes for 5.16 as well.

OK let's do like that. I'll queue the binding changes and driver
changes so we finally get this fixed up.

Yours,
Linus Walleij
