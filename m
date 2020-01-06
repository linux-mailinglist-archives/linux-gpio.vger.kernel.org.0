Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F04A131C43
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 00:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgAFXV7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jan 2020 18:21:59 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40745 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbgAFXV6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jan 2020 18:21:58 -0500
Received: by mail-lf1-f67.google.com with SMTP id i23so37533060lfo.7
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jan 2020 15:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q9R5SEqk2RoVPGepo5eJYJ7/siY1dXTcAAns3GhcGVQ=;
        b=sSm9hD3qn1idlUngR9PmqFvVyQGsUEJNg330Oqc++mHytoNqHENjqV1D2Lzd/Dc9n9
         1kuq1LbiQDJ599KZDnQUitiLKphm6TL1rgNH84K9nVPWOyQHSMBfNW9K1P+1/6YhXli1
         p8hVsTK/I12hW+IgKfiXAaj7M61eWYJDnB5gJesbKLSZOAqeIMm/hne5jEUMtae/QErZ
         0QdmbGPsBE/Vg822ItQ08dREH8m/OujqwmNz09/wyiU8G4XJkFxW9Q1Krpl681Tb4o/C
         FDzC7dPiIuM/jmosglsxzHARgZrz4vcL8iHvXEBngRt5OZsFkqqk3NWHmDIw93dc3zal
         2K2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q9R5SEqk2RoVPGepo5eJYJ7/siY1dXTcAAns3GhcGVQ=;
        b=n3SCfoV4aD6VwucZbluZFCR5YzqKf/5gPPa3Vpg3N4+yK+gMzvUsov3slBH8fCFXoQ
         joqPXLnvBniXiLRWNXZ6e1f/evqi0qZT19ETnT5lrxyVG6hsMlVDZcxICAE5o8Zwd4GN
         sKU4Vg2Vx+0mmf1nsZ43EFr7TRYCuwduhK9ojAaujN4UWMaLeyqKo+fLQY1kXQb44Dy8
         CJyt3d0D+PasW2Bzd/SZKlc08lxASOgzWf4BIXS00Hm5r5iv1xPXHKyzgVY1Cq5NQ7xP
         6lYYZec5Hh9P+x4BVh3G+TeO3HuKcxEKqdTJgEbmVk6m+2HJLGcVSt93ENltwXzokLo9
         gefg==
X-Gm-Message-State: APjAAAUWeb34zVA5dK3hrq8PpdQmt8v6XALwV8JzzQOEE87eqfbXH2Y9
        Y7qdiJxC8Z8B2VD3l36eXrCPSKe1oPhE0ksTCyRWTQ==
X-Google-Smtp-Source: APXvYqwoQAUkjQTsYoTFkqOnBlmMjpIRMA39LMGXRMH2D2HpRAwvznYtNOJozI8Qe4FpKNBY4J96Oe1eX0Er0+Qxwy4=
X-Received: by 2002:ac2:55a8:: with SMTP id y8mr57292729lfg.117.1578352916846;
 Mon, 06 Jan 2020 15:21:56 -0800 (PST)
MIME-Version: 1.0
References: <20191218062024.25475-1-rahul.tanwar@linux.intel.com>
In-Reply-To: <20191218062024.25475-1-rahul.tanwar@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 00:21:46 +0100
Message-ID: <CACRpkdbTAcKitq8SPKU5D+11x_W45+g5Rs8PQ_TutjYVB5NVNQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: intel: Update to use generic bindings
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        yixin.zhu@linux.intel.com, qi-ming.wu@intel.com,
        cheol.yong.kim@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 18, 2019 at 7:20 AM Rahul Tanwar
<rahul.tanwar@linux.intel.com> wrote:

> Kernel 5.5 adds generic pin mux & cfg node schema. Update pinctrl bindings
> for LGM to use these newly added schemas. Also, rename filename to match
> the compatible string.
>
> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>

Thanks a lot for fixing this Rahul!

Patch applied.

Yours,
Linus Walleij
