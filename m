Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99D81452F01
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 11:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234110AbhKPK2a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 05:28:30 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:41138
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233985AbhKPK20 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Nov 2021 05:28:26 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8D9CC3FFEC
        for <linux-gpio@vger.kernel.org>; Tue, 16 Nov 2021 10:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637058328;
        bh=/O+GZ0qbV9JKdbSeqRFNBm7ySSAQt685cqSjGVfpAHw=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=v0nsdLvcw33tp2dmmTfRoeWEqw7h/v4VtEbrRJTtaTnylrxuc5WuPttqIHZUnh2fT
         7Dnsp6OtJJy4BNZd4cc7y3sZ1/ivrT+Rye795Gr45ZDVK22ruQqgjmKLiwqcY4ix9W
         RF+46VlMcFGzfVN7ijCPg0ta6G6UjJRkkO6j1gxUpkPIg0QVVNh1KNxnv1Uf8ENdbv
         MFOkjZPYldI3VCphoJIyS9JF52WJf5kbKR9sw0HWmPzd5DtIIQBidh/+jl8XnbhsV1
         QOLwBP/bFFj9DLWWyRFdpXMZvOeiLE5eGSbSCeGJ2b/qw2viqKNC3zikL3NNWo8Dy0
         Ff/2W+3Mf6JbQ==
Received: by mail-lf1-f70.google.com with SMTP id q26-20020ac2515a000000b0040adfeb8132so2155871lfd.9
        for <linux-gpio@vger.kernel.org>; Tue, 16 Nov 2021 02:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/O+GZ0qbV9JKdbSeqRFNBm7ySSAQt685cqSjGVfpAHw=;
        b=yToiS9OGoM4BOGCKfp7xaWDNlprI4fBXcZW9Nnz5tLVO103hhGNHWh3fOLhzVoeFZU
         /geDL1wQwgxqUNGWp02b5psV4l+4ei2EMDbshXBXws0b4ttGIrDVZ2Vh81eY2+e51Bxm
         ueiHCMAinHobhH+N0OZ3kO4RBa5xd2R80torZC+gCI43tsWBiiCA8JPUPRwp0+hUNVI7
         ozbbt77tzDlQLAsPfvrPToT913S5bw/7JEbvYQEufICnRX5TlvMsacVrXwaYh0UV5iMn
         wg+LKIJSo3jvPwAOgxe8EvemCdBYVu5Zu2V/BiMtJap2S+0xPmBKngUxmASF1T2ZrSAD
         spPA==
X-Gm-Message-State: AOAM5319vMpDQ33Bg84hPBg/tsOEOhoP5D2BBXu+GyfHUj6G9XGcEgte
        B24FAX+TTjp3n3JjLi3+VDB9+kEFK7z0ak2ae98YJaHaSZ6gmI95zgbbJQ2gJDTjXTE6HDCfUW0
        QxBBRbYhntm83sVSclVBpNXg0fSUczfO+qr8hvOg=
X-Received: by 2002:a2e:bf26:: with SMTP id c38mr5657027ljr.523.1637058328085;
        Tue, 16 Nov 2021 02:25:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkQWpwRbE6IFJrFB9M4s6jTblkLSEi2iHO1KLrB5XVlSnuJKxSATSfrgQqBJDRIkKqXDX5ow==
X-Received: by 2002:a2e:bf26:: with SMTP id c38mr5656998ljr.523.1637058327846;
        Tue, 16 Nov 2021 02:25:27 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id n7sm1792473ljg.113.2021.11.16.02.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 02:25:27 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     David Virag <virag.david003@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: samsung: Document Exynos7885
Date:   Tue, 16 Nov 2021 11:24:51 +0100
Message-Id: <163705828808.25843.6357745358034135180.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211031231511.46856-1-virag.david003@gmail.com>
References: <20211031231511.46856-1-virag.david003@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 1 Nov 2021 00:15:11 +0100, David Virag wrote:
> Document compatible string for Exynos7885 SoC.
> 
> 

Applied, thanks!

[1/2] dt-bindings: pinctrl: samsung: Document Exynos7885
      commit: 1e6a58ad39a638f29f9d3e8c8128a2ab355ad1ac
[2/2] pinctrl: samsung: Add Exynos7885 SoC specific data
      commit: b0ef7b1a7a07dde54c5849e0ca94070a1ed08d04

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
