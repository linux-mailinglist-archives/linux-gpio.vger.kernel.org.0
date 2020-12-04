Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37DFF2CE93F
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 09:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbgLDIKL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 03:10:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726122AbgLDIKK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2020 03:10:10 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F34C061A51
        for <linux-gpio@vger.kernel.org>; Fri,  4 Dec 2020 00:09:30 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id o24so5589517ljj.6
        for <linux-gpio@vger.kernel.org>; Fri, 04 Dec 2020 00:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=60nFvN//5vKmx+XxqeLSc0jKpEu1cRheUue0ifjZ7b4=;
        b=f6OweXEfl9JrvupUpkKoqg7SMskyzobz6044YhHiwMUT2N9bX5DVywIjVh3pF5OUxo
         hqun2ifsaKfFE7BrpI8AJZo2Qbt7pnv/Z9CmXjMe1ERLsZ2JRodm2osC7KlxxAHmhbUh
         o7eWwSm5wqdQCwNGlQKjC7pgfLtx8pUxgHs5N4ATO6oCOIEIe7KBUvUnpRTc17XxxTDV
         8YfgMNwa1cI9LYbEGZOuR+Dk+bJSYA4xTcmPyaEV8m2uN4O0dQ8mvp0wfiSVidE50lQh
         r1ozR4PSnCZdBcxOC2axsuAHY6pA2fv6cXbKnR3bKbspEd3xGWFTwYpsiJ1n1JHLE/Au
         I9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=60nFvN//5vKmx+XxqeLSc0jKpEu1cRheUue0ifjZ7b4=;
        b=L3BosHxXsX9tEN6Vz2RMW4ivxB6wUirEuKivAwf/5BTy4+hhvsab2XbDfvi3AWAOMV
         q6Fxc4kIusVeIAMDIz9sIWpBfPC58MqOp+nbcEw3lSzejUyp+uVJjFDsb9pNQ/Qx/qCi
         OMxLyJCpo1sV4vnosWGnkhN6UhN/WYz3QWVUnV8bIAAogZhLVfuNtymW67FV0kmGW/Ik
         mP0cr3xiKPOsRgLRv30cYhm1amHanjrbvZfWVJD3QooFRREESMmDPbQu/OYXbLzC+i30
         cqjhN2Wnc+1NVJO5TxSXl6EE/eMh2GUG077pKPJivYMElxSm5cFBIAO1MPpAUKIPyVlt
         DcoA==
X-Gm-Message-State: AOAM533xYxLcve3qSVriEMsoVUmF26RxPN76WG1n/weDWDgxrCRRHPXF
        xOJyZyOmnAbXQj4HIADqQe8B/dPJDqBeOqOjgPbRcQ2z1qB/ug==
X-Google-Smtp-Source: ABdhPJyyugrsBrx0EOfk3cw0ej3Ujc8kY3YZo5UGSOPAotCPDImR5GUdV6DLpKC1UVdJnSEGiK3GlrVkHHMyLNBL75c=
X-Received: by 2002:a2e:b1c9:: with SMTP id e9mr2925633lja.283.1607069368855;
 Fri, 04 Dec 2020 00:09:28 -0800 (PST)
MIME-Version: 1.0
References: <20201118191938.32693-1-festevam@gmail.com>
In-Reply-To: <20201118191938.32693-1-festevam@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Dec 2020 09:09:17 +0100
Message-ID: <CACRpkda3TpbXZn_eG+ZP14H8VFJ0js0nZXLqY++s0MhkbADRKA@mail.gmail.com>
Subject: Re: [PATCH] gpio: mxs: Remove unused .id_table support
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 18, 2020 at 8:19 PM Fabio Estevam <festevam@gmail.com> wrote:

> mxs is a devicetree-only platform and hence it does not make use
> of the id_table mechanism.
>
> Get rid of the .id_table as it is unused.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Patch applied.

Yours,
Linus Walleij
