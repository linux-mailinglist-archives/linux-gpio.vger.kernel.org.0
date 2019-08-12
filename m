Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD8E8A8E4
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 23:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbfHLVDV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 17:03:21 -0400
Received: from mout.gmx.net ([212.227.15.18]:57179 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726980AbfHLVDV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Aug 2019 17:03:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565643767;
        bh=WvBCUiocoyigiLp0Fi/IoYgHQyq8r4DYjzlDtLDbMUA=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=b6MO8jthbtqz838yEij/t1eD6ilGnGqgZxdFCdnbWYIQcAK6zNwDy/5pGeuYf/I4L
         8KEFZYWNzFeMiK65JwQ2LlKVHmtdLcbLzFbkvfaXGCMnDCGVpxC11GQiiovkxu/yy5
         dqHkckKUEA1Fut9jzyJ8X6V1CUtCdI7thVjHbk90=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.162] ([37.4.249.106]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MbxJ8-1hhGTp1uxa-00JLT4; Mon, 12
 Aug 2019 23:02:47 +0200
Subject: Re: [PATCH 05/18] ARM: dts: bcm283x: Define memory at board level
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
 <1563774880-8061-6-git-send-email-wahrenst@gmx.net>
From:   Stefan Wahren <wahrenst@gmx.net>
Message-ID: <22482ae9-0239-560e-ad4a-4ab13d864e15@gmx.net>
Date:   Mon, 12 Aug 2019 23:02:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1563774880-8061-6-git-send-email-wahrenst@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:ARo3+Icmnx/PndUhQU2k0e2sY26OWqJ3C06fIrGFTm+kAkDNG3G
 /yJoK2PKsy0heqEo+0iLJsZDm8SHprriMFTVYNr4S4GohYtz7Bt5Ic3UALXus+A2dUASB9r
 /HIbAgxcttGcBjfeQs2pvctMptxBI6X3eqrUOtrqTj8nDEUpCalYS0mG3tZ7Su3bloL9iFC
 f4VrxLoKxlDpwFianZf+w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:U1G1cJg8HDI=:Gr24C988FzpO7UmnSYRIHP
 fZAXIbOnrujKZUos5erQKmFbz2JLuhxjdQsW0Eq3tRZlpQiB4wgFHPx4qH39e41KCK3uldRTj
 Lq3ZPMvtsE1gW2XtEYtccKMQzVBuLAc0KfQFfVp+J1QHNDzr5aq75HjYedGm9K2ER1KWDDcyg
 ovsKRLAN/9CHkBSto1TqtpMwqd18M3DaLo0gCXqX2tFfL8XfSlCGBpfYZWM6ciTa8WUbml9+l
 5bGLDN0UBSahZf1Gg2Px19DUDlWtwRKZ6/fmQQtosIEdX2uAgnIKpu55t/VvseuxkAGeHqpzg
 M2QEFC4gMFjNsmQC4S4kWAJ9u9ygE6IyrkuQK8ZVoFN2sJVQPmLI1H4K5aeaN6CKmlc0DdCGn
 2gMK+JsTmEGWDAXrUBkc2GqKhkVdHUS6qiltNJvOQeAuLvUh5XzYqVOtcLxoyUMKOw5ovmfNi
 E8LfggB7C0qCu7u/geoBpNHvc7+goG75jXN9KNd/EuRk8JexEQLwX+fxwXFYENr9v1z2GBPcI
 PZkPM1xIJi7hYNjznE+QiXWDKFQvj+Upw/0cqq6QVCtj4t1pmlOSx2K57WzG2wnUTRjqXmtWD
 esMHGYzZAD9vz82CsFfRrzDkS7F7M8NqzMParFjaaDCq+1mhWe8l4sfTPwGET6kqzESBFmjti
 q3g8hYxP4yZYPPXDBxSzrUJBB+yF0txpQICSDHR9Uz7yO+kPAkiHRQk0VK3rWVAKPldAnaPQD
 2SQTMgh11n+mX/NE6wWa03E+vGUMWRulx2FIeI9AKO9wdxTiP5QTpDdOXnTSUSZH8rGOSILFj
 8bUm4RBiweNE8uTni/gUhdbXzGRYRvcXF4vvoAMja2n6guzt5R+o/X1aPLyVr+FrjVarDrWYj
 51R9R+E10zQsemR5ImCGmy0HSv295FbjTOHNcteWcS6RYvn0113PSbVwjfmPn17ZnnPnV/ld1
 hpNq9fZWyC4wohHrUk/kcb0xnU0ZEgRFeTE60pG4zU3VGwFiDxA4HSsE+mqPg+VZin5xycyho
 u23g8jNw6FVRNMMnQ4ECGVDs3yyzDJZ4k6MtoN4ETusqezDo7X/OXikML4UKeTgg1s+xPpftY
 gaPAjiLOA0eOGkGiBU3PITEE0fWPZtmpVLzl9idsV9LI5p3eZndsrAtqywSIZucX2BJ/bUuBV
 8Btl8=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 22.07.19 um 07:54 schrieb Stefan Wahren:
> Now with the varity of several RPi boards, the memory should be defined
> at board level. This step gives us the chance to fix the memory size
> of the RPi 1 B+, Zero (incl. W) and Compute Module 1.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Applied to bcm2835-dt-next
