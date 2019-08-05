Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D723815C9
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 11:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfHEJqC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 05:46:02 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41617 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfHEJqC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 05:46:02 -0400
Received: by mail-lf1-f65.google.com with SMTP id 62so52541264lfa.8
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 02:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EigxFFnXVi+ycbAy/kTNGEK+Fwzwt02vFRq9iDeakcQ=;
        b=wTunzDpINqhR+4AaOb7k0PUMEn+HlEfGFx+FlWR2U4iy/cylEH3RAntWJ7NFVvNabO
         9yZ3AS27d+CeKCOAZsgAn7iqb0Kpn4DxLRP0MFS7Zpd5YPEbCfcM91fGYRnYiQ91yGDj
         4R4LI9KFkYSteGxa4dFm34Nfj5j8xKLZmGLk0uSCdk/S8eqEpK1wbMxWuBA/otW1jfYU
         w6R5L7tyJ1iOnTF4me41kHL9C/hkDOTPI+ZUEKsouLp88j9dwts4jMBws8IXF6Uqd3rI
         oXt2v6LwXsAmKtGNF8cA7XTmW7HmMnLwR9FX5PtgtV4izttPE1zADvQMbDCN3qT12Qkd
         GgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EigxFFnXVi+ycbAy/kTNGEK+Fwzwt02vFRq9iDeakcQ=;
        b=P4ZobyrrNsTvam3H+wgCGAu0L7fe1hLZO1xnVzOOrKXbdqaMnnlW5oJ0GIXWw3vEPt
         PT3oZPjtxGfzjgMQzbOI6YORYeZ/1LLrpicfyuZYYjZWNI+IveHyNNwsLjUJtXFTZ9jf
         16bHMrG8b7CBM0HMqUq8O4CJk/nwRJj2tRbS1YkDy9G+e58GVIybfAGoJ70Z3Et6j8yB
         Pd6etTRxXVQZGViO0wfjunESVRqr2i/hcBtsTingtdj6DcaKJCPaE7Bq/UqwSIjWt8q4
         G8BNAyq6u6anYZuJHgvt7hXlVDEUahcUGSp9X1GoGXkTULDGCVMQznE53wolTCd/e22Z
         1u0A==
X-Gm-Message-State: APjAAAUzfmiAq9FjCCPPytJJC+9XyyFBrAkg4OKc7Ad5PJnixq5XLh9t
        kYE0KYcfYnKy6UEhFWZSRTPTYlv0cNmBKe2r02mi3Pgr
X-Google-Smtp-Source: APXvYqyff545OWAHIV0M8fbeetZHeeDcq6/okK+LVeABVse5mPoU7C/xZ9U2T9JRixioNB2dn4I5AGCgz+GKlKqnTzg=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr68690143lfh.92.1564998360686;
 Mon, 05 Aug 2019 02:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190722090748.20807-1-ckeepax@opensource.cirrus.com> <20190722090748.20807-4-ckeepax@opensource.cirrus.com>
In-Reply-To: <20190722090748.20807-4-ckeepax@opensource.cirrus.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 11:45:49 +0200
Message-ID: <CACRpkdaMt99Zor1EOydv35Q6L_guQst_8G+UOhP92jJA0Urn9Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] gpio: madera: Add support for Cirrus Logic CS47L92
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 22, 2019 at 11:07 AM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> As the gpio is common to all madera codecs all that is needed
> is to setup the correct number of GPIO pins for the CS47L92.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Patch applied.

Yours,
Linus Walleij
