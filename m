Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628981AB366
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 23:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729875AbgDOV2F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 17:28:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729588AbgDOV2E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 17:28:04 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F7DC061A10
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 14:28:02 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id k28so3857520lfe.10
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 14:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mkb6wSNoRk1OlC/if/7Kst4oK65lFQ6w8njdJebIWcc=;
        b=qux+Gbm2lAWVYosEyjNgX6Wpr54g07vbWofzCEQWsXItlJNukKjpv4fh+Wa/qEDNTz
         GJvgN/MKUWkh1NP+4BQAyHgHuAUnYmfIg6R77aJAbXDphSr+2KXpWHh8KrrolJr6rj3p
         0PrsR1ladZCNy7TxlOmA6OW1KeEGdLfmVrNMjqadTa8+EDeSVgiTGoujJOpUUUC78PRt
         egbK3z5EDy+QTFnTqLqMcr6sGT9cHiYBKQx0zxu8gXJIutuxYOnCJxLufDRqUe93t7MG
         7YSlUY2KrlQDs2BjWKl+epd5QrL2JlQAvEsVRgqkqKFdIfivDXP8wwISUcurl1AmXg3d
         sNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mkb6wSNoRk1OlC/if/7Kst4oK65lFQ6w8njdJebIWcc=;
        b=htjSZ9lSMPZp6OVA121mYNvRNrx9vxtj1R6smDH2jicUNLtRz01vLCuSwIA/hHhzww
         lhWKT8rSllA1oKZ+lB/rDNPJtXrhnFdblLp4uFMg/UWhIdUvhYPG2LIF4Pq1kKV4RuEn
         Qvw2uMVXC6JOJ3ZOhQ9gqjMEJ51Vory46WGTjWUnmT8/Pd1Kl7D5r730AhSDI8gJDwod
         l/9BPqqlG8R6GRYdeKl1XRDL1ajpdx5Ir92sQXZUns+Bms8iqJbNxyw/6+mqslRKJVuj
         B0hfv4k5TYZAlGoFxHoJPmrRJOF2HluMMXxoreOcb5m68DufPLgOrzLYQzMKc762Ieqt
         T2nw==
X-Gm-Message-State: AGi0PuZtngv4fJT/i/FxeQMFn2I3Sst3F89h7pFdHJydDwi9EpxRo0cB
        jWG9ye3zXTXN9AuOvECXT9MLqTv89PtQ/sB+ZCchWg==
X-Google-Smtp-Source: APiQypIepQnzV5Bfn7cf8bAwx0BpkpxyfPDAlFI7U8s810COu4MBHoFRESFus27Kqr6HelOuxibh6jPClEFo5LlrBj0=
X-Received: by 2002:a19:48c3:: with SMTP id v186mr4084748lfa.194.1586986080980;
 Wed, 15 Apr 2020 14:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200306132505.8D3B88030795@mail.baikalelectronics.ru>
In-Reply-To: <20200306132505.8D3B88030795@mail.baikalelectronics.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Apr 2020 23:27:49 +0200
Message-ID: <CACRpkda3YpCxVii1r5F-q=b_Eh7ixbtprWykUH7xPDxPZR0gwQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: dwapb: Fix reference clocks usage
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I have applied the v3 version of the patch set after some tinkering
with the b4 tool.

For some reason some patches are missing in my inbox and also
on som mailing lists, they are not in my spamfolder even.

Anyways with some help from Konstantin I managed to get the
series out using the b4 tool and applied it.

Thanks!
Linus Walleij
