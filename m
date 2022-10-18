Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 628616026EE
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 10:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbiJRIan (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Oct 2022 04:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230327AbiJRIad (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2022 04:30:33 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B88419C7C8
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 01:30:22 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id q9so30541275ejd.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 01:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hqt8cxHHRtc5PFjPPVuM5Mw2r/ovnlkgTHRmPal6Ya0=;
        b=FDTMhZ+9oazMoTtlCO0M7umaupi4dLOoznVAMhmqyxhaEKHPtQ1MTheoBS6pP4j5zw
         ZID++ijbYhm0DmL1g/UuwsYbMc0sS+ne3DoTM+cCR/D8xPyTnmaQP97hPv1WkLt9w1Fp
         a6Zi6fhz+y2kjT42KdfLQt0NqhFICJPUR/yoVLRLkYH8/VfN0ci2s0VxU2M2Vj6n9f6Z
         QGlihR8A0tWj7RGFHVBEhGg6HQUrQ3egZApfdV0D5e2KMf104Rh/+5/7fHTAXqisgX+u
         vRajAAATZgRa8x0Z8MAws1xlzXw5FAVc3ZNz9itjWWAJXlMFuLV8fFNnGQvon8Gd6GAk
         EFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqt8cxHHRtc5PFjPPVuM5Mw2r/ovnlkgTHRmPal6Ya0=;
        b=L+vXzDUUM86Ut+WsXCijE5xWkdcWRvwtwp5Or0b5F4VnQFGZmDjMgDhVsb37M3BUHj
         74KFEFFBxKjycyk75x6g0hSHWnQLRM8SeipobwALryfmxoUBPNND/I3TN1nR8DBmk/1o
         14C6RDIJfBT+hsQR5PM4vtMrnpHFfGCS4VVNv4CMapbJ+GPu9sUh2CIrUmvq4qz2mQve
         WVhjVMocS474HGk6/HyacFvO854xQUl6GSZ6cgJm5C0Qst14OBvexGycnssJMLcaqp14
         xn5Alcf/vGX13lgM+UAuLHOAWUfZ99GRnBtndqEh32MBWyppEra8AyrpnfcGKy8vXsww
         NHlg==
X-Gm-Message-State: ACrzQf2BeIrVUG6o8ebQddSaMEGMiUgkBfGqC8TnqwGZsLkQ+NTJqmo8
        SRJjsoksdZINBYZudtVfl3DUHFaJ0DKh6mhhjgEUMg==
X-Google-Smtp-Source: AMsMyM46clkzT4OFGpyI+i/Qpn+rdobOHLL6DdBtkDGX1ssSmZxPJN0wff+sCit0IWCPBGJG7+NqGeG70982R3mseSU=
X-Received: by 2002:a17:906:8a48:b0:78d:acdc:b7d9 with SMTP id
 gx8-20020a1709068a4800b0078dacdcb7d9mr1498025ejc.500.1666081820716; Tue, 18
 Oct 2022 01:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221017171506.64183-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221017171506.64183-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 18 Oct 2022 10:30:09 +0200
Message-ID: <CACRpkdY6CnetKHQCpWPv_e559Mu_6im7GPMuOez=HwpSy9favw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Use str_enable_disable() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 17, 2022 at 7:14 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Use str_enable_disable() helper instead of open coding the same.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
