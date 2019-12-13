Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 631F311DFD6
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 09:49:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbfLMIto (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 03:49:44 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35118 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbfLMItn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 03:49:43 -0500
Received: by mail-lj1-f193.google.com with SMTP id j6so1766642lja.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2019 00:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E1JOZKU3xEudJiyZSdDJXezSL1VMnF9zJ7hQY77MyhE=;
        b=sK4ZgQ3I1MDMt1BJme+WWnKfSQHo54j1ZoLoWor4/ASvWr1mjNT7v7g0/BhdIeVyph
         Xm0WWDGOKCsOnB+Vb7zo5dqwk2cFqH5L5CMH9KG2WudlbpEhRAEFJM4l5AmOQFIwhq4e
         Z0PaSE44DFQmm1KxgwogrNgfaWXfE93iwQBGxWpqK7+/41s1D/oQ5Kw1ddlzVoq19xJs
         CW2LGsZI5i0XOQuL13yhuYRQj34gZrDOJmPs6ba4/LL6UTo+OeLdCBYkHdzy5xT9vmko
         MH9bMeGD8aZ/tVNSxW/yeEfjEo1kl2FDBmp5lHja+RYQz11gS1d/CkRiBmco5JvpKfCm
         J+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E1JOZKU3xEudJiyZSdDJXezSL1VMnF9zJ7hQY77MyhE=;
        b=M0xqzdEkkC9b0x6YYLV0w0gcMGRLykWqDsMzLOey9V4OsiYyaruwgXBHeMuXOSeioN
         UgdOHBIK6BXoVNF+cCNOFO4gw5PJ5ximbh3Mok9a1tKHZ/n4gVPrgUJ8WSQm7cyIW37F
         ME857OKa6gaIkk0PhXp9ALjpkV7jSMYuyll1qc3F/40yIJHeWU3x0qAeS9aKwn0Dx4+1
         8uUN+mV5BVdznBje9fLdtAKMnsNBGi2Klis/vixp9mXe6CDXXjSbuHhR3r5UcVvn2XIG
         t7MfInuQposyqB2PGMR38dK8VjU0rOtKWnv4/Qt+GHUmxbWypUumxmRZ2jPN3v2l4nGl
         7tBw==
X-Gm-Message-State: APjAAAW7Vbx5Sr9Dey36HQn2+H253zdnn2HG6BVtVyKpZs2TRqv4YbtX
        1TBbkNp7VKhH/CfohX3EM1LFAaHnoN2NCUmUkgshfjya8L0=
X-Google-Smtp-Source: APXvYqw8R3tVL7YcPB1QUWAfPaywn/OZ8gj8e1LzTXq3Fsdndmc67+vCT3PwvhB0ehsJ2ot7As+6b33BkV5z0TC0TKk=
X-Received: by 2002:a2e:844e:: with SMTP id u14mr8785712ljh.183.1576226981672;
 Fri, 13 Dec 2019 00:49:41 -0800 (PST)
MIME-Version: 1.0
References: <20191203141243.251058-1-paul.kocialkowski@bootlin.com> <20191203141243.251058-3-paul.kocialkowski@bootlin.com>
In-Reply-To: <20191203141243.251058-3-paul.kocialkowski@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 09:49:30 +0100
Message-ID: <CACRpkda-hDbC4bVihPO8RUogkFkPfsxVS13d_JJoFZLaPLQYcg@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: mfd: Document the Xylon LogiCVC
 multi-function device
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 3, 2019 at 3:13 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:

> The LogiCVC is a display engine which also exposes GPIO functionality.
> For this reason, it is described as a multi-function device that is expected
> to provide register access to its children nodes for gpio and display.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Patch applied to the GPIO tree unless Lee has objections.

Yours,
Linus Walleij
