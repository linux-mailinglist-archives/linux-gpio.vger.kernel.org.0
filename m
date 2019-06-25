Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2AA527A7
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 11:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730298AbfFYJKb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 05:10:31 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46285 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729530AbfFYJKb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 05:10:31 -0400
Received: by mail-lj1-f195.google.com with SMTP id v24so15439696ljg.13
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 02:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zwr1PE/zFB5PKkIkGjbG3TZDF5+gr9ZCCNg1gu6crkg=;
        b=ylNDeQ28lqhCQJPI4uvHoSjA34OakWylFf2P26GwzKrxFa201i4sAW7N3CkA/0zcP0
         zNh4G+kxIquOY/fJx/emhD1a8A6/5lepubpMPn2SrNwNFr+9Rr36mPN8yODMxBHygeez
         sHdOBZSgPQ7fawG6i+uBPl/eo6UL6hL+zE/pdo2QEqjb0HgyFJodXnpF6v6mxlqp5Kno
         YOKpY0CY2qd9LsSOE6+vlrdwYnhJGvWqcZ+xeeyhActrLW0oOltqn6mCExn+RTPh0bny
         VIBC8y7w1GMsmoVcXIEzyB48cpvi1I8SDKWz9qYCoNjQgwLitn0F3gGMl/okq4Q1qpW3
         OcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zwr1PE/zFB5PKkIkGjbG3TZDF5+gr9ZCCNg1gu6crkg=;
        b=UyH76Bq0lMOuHLQ4ON2f7zwOKNxQ621UYx8KYlaZXCyyy+AZuYQRJfNXUL2y+dD4gP
         uMScU3bB1DiqRVfwFt42KyTw8qWul6XaUX+VbwtpxP3evZKIRY4VGzZfqQFK6UjrA2CX
         Py5FwB4eFhe4f71w61rBLtxM8IoDOsV0AmURDCxhA1JRc5tpyHIbtclYePax0MAi0OqK
         h8nT4Uyen6l5/jT/Gi7lQbsP+2FmODr4oEtYjvGnaWNEEM+aZdS3KUPxAjQm9M0U9Oq4
         3L9PmALz1sFhrAnJSFLaElNvAcq3FhkXAtoAgpix5K1fkBKZlfzth1mre703mSXEdSmM
         S2xQ==
X-Gm-Message-State: APjAAAXbtdKE+2MKgBttac1h5skk++BHyijaAiW2x2yivg/okyBZkapM
        K9iAfAMJaMkQ5pLom7YxS4BamJLssqOaNpMdvelcfLaB
X-Google-Smtp-Source: APXvYqxqYys/At0HjJBv2RiPjyTQ6OUMKPdUNvdTGIbYJLAeuDYXTCojyivNeO8CipAJE9OPWpzFP1pIpcU22QYZmwc=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr8483629ljm.180.1561453829057;
 Tue, 25 Jun 2019 02:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <1560790160-3372-1-git-send-email-info@metux.net> <1560790160-3372-7-git-send-email-info@metux.net>
In-Reply-To: <1560790160-3372-7-git-send-email-info@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 11:10:17 +0200
Message-ID: <CACRpkdaqEpsw4br_5+CPHdqcJOX0b8pO2OsjxztQ74jA=oPm7A@mail.gmail.com>
Subject: Re: [PATCH 7/7] drivers: gpio: vr41xx: use devm_platform_ioremap_resource()
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Lyra Zhang <zhang.lyra@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 17, 2019 at 6:49 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> Use the new helper that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together.
>
> this driver deserves a bit more cleanup, to get rid of the global
> variable giu_base, which makes it single-instance-only.
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

Patch applied.

Yours,
Linus Walleij
