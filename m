Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7F29203237
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 10:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgFVIi2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 04:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbgFVIi2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 04:38:28 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1149C061794;
        Mon, 22 Jun 2020 01:38:27 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id e22so2278994edq.8;
        Mon, 22 Jun 2020 01:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cUFbNHgo6IB5Sy3bImSkiGN8kcxHOUvCTIjR4hYNmSs=;
        b=bfWp2zi+iSVUaRV5UZNbccpk4TXYBNwDZiBOkKQ6/Dc+VtX1X+9Gs5ceoLzrXq/PZ9
         vXaYBUjdU16fUvGvH7DbVVvuUJmvD7Ir0nCACqiMv0Rxj+i+sxU2NStf4EtixbkFlOKy
         QytxIaPtV/BZMpCFLSoO8YESWhVSKs0LgUsjH68AGN5fjOsvqNDd6cdj+em6FuyBw7fK
         R/OfsV6tCgIXwW0sjEGfTlXo82vaUwPu2gcM6g28cM4z8vWVksdp8wg+VX/MeN11ejjL
         xYB9q3o3AMQI45ocSeuP0niuxAkeWPNtbZ9pnjPp+PDfBBgjjP83pPPZ4wgeWhBfQDtR
         oHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cUFbNHgo6IB5Sy3bImSkiGN8kcxHOUvCTIjR4hYNmSs=;
        b=ksqzriVrNrdsx9UZwov79LDOg5/c1SM5qxL4EzFOJNI+xUM+jdCgyV1O7VMVh2aTVJ
         J5h8DKhZKMTFKVPAmiTnEeRbRSlBljSwAMdmeDpJtpfwNMAVQP4suKO3nJGHyiqzGLIR
         MzvW1yVthjsxVti2O5+U42VB2P2QCfmc/J3rl0tHCk2WJN1h5KyhYxSU21PeYvoLo5Dq
         EpDkHVa3TGlV8xUOYyNDaM5/zAcbA38cqDxe6sOsL9iEwWw8N9FVnSTFLPsX4AyTYqwf
         Bxa8QUAYzUrmzdIyP3dITf98/IjfaIiVcBSsqkWU4goSS45Z2ScGqkuzhJLmVbKbGbW8
         ultQ==
X-Gm-Message-State: AOAM530yxiqhB+3MWEH4FV93TnL7utBXdBZkAZbr9gY+no/zl5pKySpp
        G7QlZWUxaUGRrORjwa7hgP9UnPX7le7jtrNgL6A=
X-Google-Smtp-Source: ABdhPJwPApeAEn5hum2A9icysOaHVQpVvzup0Zr3/5gcyJTD1N5sRC7gkUmnieQOj9zEqFa6NauS3YRK5ZO9HhRy3/c=
X-Received: by 2002:a50:ec8f:: with SMTP id e15mr6447759edr.70.1592815106098;
 Mon, 22 Jun 2020 01:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200622075749.21925-1-konradybcio@gmail.com> <20200622075749.21925-4-konradybcio@gmail.com>
 <20200622080503.GQ128451@builder.lan>
In-Reply-To: <20200622080503.GQ128451@builder.lan>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Mon, 22 Jun 2020 10:37:50 +0200
Message-ID: <CAMS8qEWrnHc3CWrW-vzwxu+PR8FL9hcvCtBpS4oK9ZYXgGfLJg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] soc: qcom: socinfo: Add socinfo entry for SDM630
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bjorn,

you said "Applied" - so should I omit this patch when sending a v3 of
the series or keep it in there?

Regards
Konrad
