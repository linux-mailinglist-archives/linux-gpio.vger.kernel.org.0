Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0A1274991
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 21:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgIVTzG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Sep 2020 15:55:06 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:37197 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgIVTzG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Sep 2020 15:55:06 -0400
Received: by mail-il1-f194.google.com with SMTP id q4so18519814ils.4;
        Tue, 22 Sep 2020 12:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=USd3lMxUpeLJ7HI2PyXzz1KORx5trabp4k/52b9mEsM=;
        b=PN9vI/V7HqOhMU1Qe/f9K7tmxxI78qKpeQP7ywN0WEMtqth/ATqiV6phfJZKmdP17U
         BvS/68xsn/Kc4xCGSCkKQMNoB8q/MhODrhDVH39won4pO9SPqLO+EZ+sQ/Cm5HGZO+ZD
         NOIp5IDwI8nCxlQJTEsrN3hMXfQxHrqHmQ0nbwlmZLU48aATxAvoje2JAzJInIZzZX2q
         J9p7DiFZRIGp25gJ3A86fZYK5adZFRTJuJXT92ao1VqrBivGzEhy0CTj3qE6nowuM4eI
         KjjAh/2dtH4Jh3iky9iV4o6idJ6cATAkW9FNgBBo3NzZe5ChQUENL+yaI9NCPSQVvpIU
         EHzw==
X-Gm-Message-State: AOAM530y+/aHmbNuBXRpAg7Y2qrPKA+IzTSbH073vWh3vKJqUizbaQfM
        chwZedMa8tCWezWmbeqTzQ==
X-Google-Smtp-Source: ABdhPJwj2BE6micM1lkkcksxJECMdC6HW2GU1t/beRU875e50kL/1p49fBzgChJG13JUlsfc6Gtjmg==
X-Received: by 2002:a92:405d:: with SMTP id n90mr5587771ila.58.1600804505292;
        Tue, 22 Sep 2020 12:55:05 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id k82sm9524036ilg.77.2020.09.22.12.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 12:55:04 -0700 (PDT)
Received: (nullmailer pid 3133406 invoked by uid 1000);
        Tue, 22 Sep 2020 19:55:03 -0000
Date:   Tue, 22 Sep 2020 13:55:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Olof Johansson <olof@lixom.net>, punit1.agrawal@toshiba.co.jp,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>,
        yuji2.ishikawa@toshiba.co.jp, Marc Zyngier <maz@misterjones.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 4/8] dt-bindings: arm: toshiba: Add the TMPV7708 RM
 main board
Message-ID: <20200922195503.GA3133377@bogus>
References: <20200909204336.2558-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20200909204336.2558-5-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909204336.2558-5-nobuhiro1.iwamatsu@toshiba.co.jp>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 10 Sep 2020 05:43:32 +0900, Nobuhiro Iwamatsu wrote:
> Add an entry for the Toshiba Visconti TMPV7708 RM main board
> (tmpv7708-rm-mbrc) to the board/SoC bindings.
> 
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
> ---
>  Documentation/devicetree/bindings/arm/toshiba.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
