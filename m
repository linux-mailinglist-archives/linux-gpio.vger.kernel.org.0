Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04E7A27CF16
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 15:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729212AbgI2N1B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 09:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728253AbgI2N1B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 09:27:01 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9947C061755
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 06:27:00 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id b22so5462937lfs.13
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 06:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B3ONy2UEfURniD/LDED8tr1xeJcvKDrV1FhcEDlZN1c=;
        b=i8HkhsevGRuO/1O5qc6zqJQJMWeWJ6YjXtnrcAkQaKBLLMU9r5g9/CFT8Lf1byQ9vD
         MBkpuW3yyx2cjmDVpWQyjQPTWcun2lPWm/FtUmeIrvDXD7wnwRCX8Oxac4u3ZGMI0JlQ
         rS3dnHTK2iOzyTFe7HgXA8RJa2eR6VyNe3YJ8NdSNb6C94kWKkxAFU167ySxmTHc6/8y
         oegxD3xbulxRIa2ZbJAFrmj/2q0TN/tgkt74ZJvlf2r/EvTSu3b+rtOUar6Kz00oAyz2
         P7wvIDy5FXWW2BrxTO20lFy30cEd0B5M/cNExQkabBbKU3w9vS5WpGrQg3wN80XTojFu
         txSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B3ONy2UEfURniD/LDED8tr1xeJcvKDrV1FhcEDlZN1c=;
        b=kT64Of4LU88G4bJ+dJCx/Xjq4NuGp1EYUZo3QgCwMHlJplpOEbFedrO5xLxOjTPs0S
         S7IFCdUbFUjsCNAmThKRXnCn8bFyhOSVSxDSsdEcgAfSTNVayg1ovzIYsJMelWuXRCIL
         863Y1SSN5ort9U7id3mWF/UllsRI3/HWRo/XpMMgHg+eMytMQvnjbZqCphzaNTwXJg3I
         KTzmzm1tiZTfWhgnxDhZc0rd1v8gyYSFy/Pn4ULY9G6hYs4e6V/nIlGbiE9yGU5LuEPs
         Ib2vspj2jPR5osBq8hXXS2CM5VY0Pyn1zbb9fCfJwAAFL3D1bB5nwELERaHzSegtBwZ3
         A2Hw==
X-Gm-Message-State: AOAM533upkD3BRZTdFDxLkdV2g3iQfCtYYWG7djlTxlkBmNCt774/6A4
        vb179/JouEKqGxrqpEgaMg9Rc9WkgApXfvCxeR9zOw==
X-Google-Smtp-Source: ABdhPJxYZWGx2BlnL51M4o0KtLt6jFMMUDac9OLNYrtc9O+5E+GkaUjkVK+ISl76t+r5900wTgOVE87xLeymBxW9JHY=
X-Received: by 2002:a05:6512:20c3:: with SMTP id u3mr1126095lfr.572.1601386019274;
 Tue, 29 Sep 2020 06:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200921131058.92941-1-miaoqinglang@huawei.com>
In-Reply-To: <20200921131058.92941-1-miaoqinglang@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 15:26:48 +0200
Message-ID: <CACRpkdY3OzSLugezpB3KMatvo+5WFNEP7cRSKJprGUSeEY7UEA@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: spear: simplify the return expression of tvc_connect()
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Viresh Kumar <vireshk@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 21, 2020 at 3:10 PM Qinglang Miao <miaoqinglang@huawei.com> wrote:

> Simplify the return expression.
>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Patch applied.

Yours,
Linus Walleij
