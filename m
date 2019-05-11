Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 789111A862
	for <lists+linux-gpio@lfdr.de>; Sat, 11 May 2019 18:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728664AbfEKQUk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 May 2019 12:20:40 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39012 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfEKQUk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 May 2019 12:20:40 -0400
Received: by mail-ot1-f68.google.com with SMTP id r7so3769511otn.6;
        Sat, 11 May 2019 09:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IcR7GsRLpqULtIKynsyrqLMmqF/3vhc8y/6VH73ngso=;
        b=kWvHSPzTGBn93qjDGdvqV2QssMNq8Z5PXN+o2VhamiFxePMmuNo6/7fFyE30lBdTJ4
         aD4TXGuitnPLw734aWk4xllXpr7hze6CkGvFYt23cpvF0C1niYHhSAU5fEkIs1SLSiVD
         XCoxOWnqe0PQsJ+iFVmF5sxQekY3rCE2abBjnkcrfK5+ZrWI1jYQLWIDYN7y623KE+UP
         0LqZWAhjePh3nnUSf1ArE43Rxuhbe7yKMgBrCTY9x0P5Jppxw2HWQvYqcJffdhdV+cU9
         iXRHQSIX6VIQjUhhaX0E+qmZw3IRwA2V+3+H5JEBZMGoQIULpfgEmg9T4xV9qDyelE+1
         1DUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IcR7GsRLpqULtIKynsyrqLMmqF/3vhc8y/6VH73ngso=;
        b=OEgADi+jrKyQ7KYK+AtuvuWNJIuTpOp1ZiRPYjYDqz+hld3aBfsXCrzj0w+vi7ejbF
         s8XUEszN0du8IK8Y+2AgXJYTROAM7xcf3ouilLls810f7KDaoTFZBowBrFtO/iTBbwcS
         k/T3hz3j1q/qhB/7A3hHBPvqrKELpnT/MOC3Z2zxkpJpq7N6r6gP5I9Vg/pPudAKgOZj
         x1h7HF879hQvy2PrlxEzQejoNnduZv/gK7j/dzIW/n1IPOYbt5+GLymObRNrDf5Z1gl0
         5guPCJgyTQVRCBg/awiKPxgAQc9VfNVbzapJhPGvrpwn8ivyXKdLZ4FnybGq307yblqv
         3ByA==
X-Gm-Message-State: APjAAAVtMkPJdFUm1BN5fm2uDEJ1HjdvYOWwxhBrm5fXb64CrrAro6QS
        3cuOEAjQzAt/RALD6bf+TguxXbuoE0TR4+gQSyoTMba3HiVfTw==
X-Google-Smtp-Source: APXvYqymRT40LZBXnC8V2R7PNyTi4K1XofpMaUTO7X59C9Uf1ziO4aQfmbu9W+4bj7LWRknMqFH9TRCgMN62UvVZDyc=
X-Received: by 2002:a9d:76d5:: with SMTP id p21mr8224125otl.308.1557591639440;
 Sat, 11 May 2019 09:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190510082324.21181-1-glaroque@baylibre.com> <20190510082324.21181-4-glaroque@baylibre.com>
In-Reply-To: <20190510082324.21181-4-glaroque@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 11 May 2019 18:20:28 +0200
Message-ID: <CAFBinCDn-jnT_Mf2p_oZB2wG4+MzJO=ZymH0zg4OygaOY1G7sg@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] dt-bindings: pinctrl: meson: Add
 drive-strength-microamp property
To:     Guillaume La Roque <glaroque@baylibre.com>
Cc:     linus.walleij@linaro.org, khilman@baylibre.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        jbrunet@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 10, 2019 at 10:23 AM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> Add optional drive-strength-microamp property
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Reviewed-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>
