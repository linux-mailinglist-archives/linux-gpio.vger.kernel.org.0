Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C453220B533
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2020 17:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730001AbgFZPsd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Jun 2020 11:48:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgFZPsd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Jun 2020 11:48:33 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC57C03E979;
        Fri, 26 Jun 2020 08:48:33 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id t9so5410272lfl.5;
        Fri, 26 Jun 2020 08:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1go9gTeNkzcp6wQgoMl3JBGyFoxtum7G6W5ccT4ChgU=;
        b=jFHTsIfpHCkFW7ktHRSc5xD5/1Wl1pdZ2ho0kG9586G37qcNfbz62vcshRhpABE1Bh
         gssdWlK1xhz4VPmNQdT0xFvCANzldpP4RYKt8h8J9TcZcMH0lxnNwgkdBKCoFEkZ5z0O
         sLddbsk/qU0nTtvSqO0qLmMbxfmZGH7ewczTKTS9+2fLqeOEB/49xN75tciCYU/IlAD8
         Bguvmxo+IpqGtnXwx6O/iM09pL6JVCLwFhCYatiwcGSwQoFXkGUvqUWyBlmo547g303v
         uDflF3WgyAj6Z/AD32Roq42ZrtnAo9LOQzRIlaa/WG7oz2Ih7dlHZV+cWeMl/z6nVSk0
         onUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1go9gTeNkzcp6wQgoMl3JBGyFoxtum7G6W5ccT4ChgU=;
        b=LQo1NFH0GCHmtoYb9QMh40z6bHpj2ajwqRkgAsP2+Vn3Tf1x4aLo4qzQc1lVhY5DFL
         UnV9PMqOXVCVhj+fDhwM0EFw/idABZ08Y3E3It64i2jeZtxmZlkIZrt5fdnGg9XQk8Ii
         fWT/FfzrrG5sqkVgEC0Q3sJJ+C4NRPxYvPIwNNfNX5RsKwGkuDs61CkvISIu3GUtvlyy
         fmakbHLGwlx/jahD6/kixgJR+oWE/fq0eSB3gtqRU2Cw9NouCl9tU+jd0SSpU9ifQjdJ
         Hr6ZtdGNPOBG92Fdwxwi59DMN4UQrvzCnQZE3DQsglM8MUYvXAaV0L1rGfVv86pb8iiT
         VKHA==
X-Gm-Message-State: AOAM532u0ouF/S3kjTaIwxL54KgpPV4D7GLJQ+5VYwhKUqXcfHUSjk+7
        351aptiqgdBJIAwR8CR8aNl9o4xnZCatfUR6Sol1gL163bU4cw==
X-Google-Smtp-Source: ABdhPJxilQxR1MaNe3ZEOGBRsalVgzi1it09jwDjJkA5kV/h2MumLQpv701P2RRWj6LtJVpPyV/zqHzt+QB6iffvHhs=
X-Received: by 2002:a05:6512:31d1:: with SMTP id j17mr2068193lfe.148.1593186511374;
 Fri, 26 Jun 2020 08:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200622192558.152828-1-konradybcio@gmail.com>
 <20200622192558.152828-8-konradybcio@gmail.com> <20200623072535.GX128451@builder.lan>
In-Reply-To: <20200623072535.GX128451@builder.lan>
From:   Alexey Minnekhanov <alexey.min@gmail.com>
Date:   Fri, 26 Jun 2020 18:48:20 +0300
Message-ID: <CANi4RBQY8dXU=74JfB3hHZYMqMgVwtHoQsLZXV7CpwZ8ue2icw@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] mailbox: qcom: Add sdm660 hmss compatible
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Konrad Dybcio <konradybcio@gmail.com>, skrzynka@konradybcio.pl,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tue, 23 Jun. 2020. 10:29, Bjorn Andersson <bjorn.andersson@linaro.org>:
>
> On Mon 22 Jun 12:25 PDT 2020, Konrad Dybcio wrote:
>
> > Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>

Hi, I can see dts file in linux-next using compatible
"qcom,sdm660-apcs-hmss-global",
but not this patch that adds it into the driver?
