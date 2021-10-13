Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8E942CF08
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 01:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhJMXRo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Oct 2021 19:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbhJMXRo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Oct 2021 19:17:44 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FDFFC061746
        for <linux-gpio@vger.kernel.org>; Wed, 13 Oct 2021 16:15:40 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id t16so16699719eds.9
        for <linux-gpio@vger.kernel.org>; Wed, 13 Oct 2021 16:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7ju4FdDxKeupxsvqXZ5L35NpfulDrv5TwhuxEV1jN1w=;
        b=JQSjgti/r7jU+WIk4smaWkBESjkcXnhOMhcHqndNqV+pUI+gmV/swSHLTLisx8xvg7
         MSfh8F5cojRM+TCzPq4pgfsrIjiBib8cv+NK3U4ThyvAXXi41u3/Evbm4kcxXXbwQnVo
         NS3NBwoNybumVkfyjt2TNNANNA/rUEOLEDZEJmfDlKeXN5i/jYpevswlCmcTi5AeTeCl
         CH9GgNgBSM1pp7BvWavRnRVXP0OAr11qjcAH54j+x8W4CMv4WMHVYBFZvEB/HP2oTA9Q
         38kv8qxrY786+dL4Ws+G/m1+TGnzm6uSVX5SIO++fw+8mm2P9H+57sOI5/H2ob/fgUkz
         zckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ju4FdDxKeupxsvqXZ5L35NpfulDrv5TwhuxEV1jN1w=;
        b=tRunszfs95oqq1XtAbQaax9FxcODm77R3CrxGf1nvdXseRyYHH+DsQP7QqI4GZGIGx
         cwlEZW5WnAyAtZf1QAQQbfIHl8RlGyRRlsISVXiQddGGNPk6Jn9WEzdiHO9QsARs7uDW
         dnMfAt/ZtjINdutPe5ESbO31a1mFS2bj2N9v9cL/KdhVD6scBry7rWXaABhN75cie561
         6J7yTumJP2q/qTjh8REPHtYcGqpo0ch3t5dgMPdyttp/L5pSWvHZtYIzjZPbb+h8mDry
         URYZVsuOWafMiSyTFq0opjagEO+6XClJbrPoDiYOLl57+nzfcO9q/oQ7HN0o6j/U201a
         igFw==
X-Gm-Message-State: AOAM532d/TWBb6xhY0/dh7u6Up2NHWiyU/EsTiStNX5FPcAzvtD4KJWH
        1hkToB1iOoBIXqyUXyWiasYI4f50EK3mo2LmUacEyA==
X-Google-Smtp-Source: ABdhPJzStUrpguO+PBbo8xyJG9VHVWSiDGZsLi1RJWVkaVn7fWA3k08WteQwAsSEmqhYemwIGMD0YpNsH1iotykM0s0=
X-Received: by 2002:a05:6402:34f:: with SMTP id r15mr3469367edw.111.1634166938494;
 Wed, 13 Oct 2021 16:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211008122454.617556-1-fabien.dessenne@foss.st.com>
In-Reply-To: <20211008122454.617556-1-fabien.dessenne@foss.st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 Oct 2021 01:15:27 +0200
Message-ID: <CACRpkdayzVCz5jDneoPWtM+t0CrJ_bY53BWUa0axNu5i66NH+A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: do not warn when 'st,package' is absent
To:     Fabien Dessenne <fabien.dessenne@foss.st.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 8, 2021 at 2:25 PM Fabien Dessenne
<fabien.dessenne@foss.st.com> wrote:

> Since the 'st,package' property is optional, outputting the "No package
> detected" warning-level log when the property is absent is unsuitable.
> Remove that log.
>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

Patch applied.

Yours,
Linus Walleij
