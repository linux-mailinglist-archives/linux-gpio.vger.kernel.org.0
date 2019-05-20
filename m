Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 252C324000
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2019 20:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727414AbfETSHq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 May 2019 14:07:46 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39916 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727413AbfETSHq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 May 2019 14:07:46 -0400
Received: by mail-oi1-f193.google.com with SMTP id v2so10710224oie.6;
        Mon, 20 May 2019 11:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k7G1MGSx6nHwpQNyADoCOs+yAwPJeVT4zKxuY01zrPw=;
        b=ZpZBX2L1phGIkWqLtP/wGPhPMbIoJguECDVjKtHvg0SxK2vj293g3R9X2fd3f3/yZL
         xAtRNLhTgspuLkunpxlKA0fR7+285acvRqZNQd+GX3Whb1mWqPP4GtaEsNZ1f9Rlqj07
         E7nUq+RnPYMQj79rxPpCpH5rghIwLEIKNoVMfUpyKkaSAuQZFcTR5/Bvq0w0v8xFmHGG
         eJKeMnq7ItUeBpDtjA/UcCT5Jm7QJbY3pvwEyr9qZVq4MAqXN8mM45x2n1F3AA+nurzJ
         BVBA/ioRgbJ1ESG5ru7e6O3Sj0GOumyy5j8t6pO1RTMq7hCZC5hGTGi6V+/Hnb1+2vfs
         xobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k7G1MGSx6nHwpQNyADoCOs+yAwPJeVT4zKxuY01zrPw=;
        b=KRQYb+sR5kI1AcSPSlv/QkH6mLvjdrMGUum5oVcSLyKK+VNv45Y/Ll5veP344Epw0U
         tM4pE7uLvWmSnQUf24BlKXfOSgtCCgzhQkhQP0UDf91//r4M43uPV4THVysWmR44+aAv
         ltpUbb/UtShE7UwDdH/n1k8drTcacLjTBULHuo8Pfvj009pXvzpgQfJx8LS3qMjL8wqR
         w+0Iej2Mqev2sW4QreVJTJ9dxuQSIRtF9pfXs/Z3jEcmyaEUoEzKkqwReLjfpyP834vw
         zalPD0UAubLgqqdkXW+MwWm8HboGBc7HZKQ8qHltWT14Fv562rOBo38Tr1RniRzweREC
         6nZg==
X-Gm-Message-State: APjAAAUjIr7ThuEniI3CFsndBUfyFzmNwNYuR+Hx0MnJG2cEMdF/Kbcy
        KrpTi/wI2RWvLW1eOgyslVYZQWvohVUVHdpir9Q=
X-Google-Smtp-Source: APXvYqy59OliiQjhnHxHS1SdLMScXn9f1+tKlaosJtDBLEK0tbw3TDkfYCYFObUPl6UzrYIrxy5IwZdGaWdzpFXXWRo=
X-Received: by 2002:aca:ab04:: with SMTP id u4mr315260oie.15.1558375665674;
 Mon, 20 May 2019 11:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190520144108.3787-1-narmstrong@baylibre.com> <20190520144108.3787-2-narmstrong@baylibre.com>
In-Reply-To: <20190520144108.3787-2-narmstrong@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 20 May 2019 20:07:34 +0200
Message-ID: <CAFBinCAaoSb9z8MHu7CmGG-ij+aBOTtUjVcgRmp+wcuiDbxs+Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: meson: update with SPDX Licence identifier
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 20, 2019 at 4:42 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
