Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41D9F6D555E
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Apr 2023 02:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbjDDAFg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Apr 2023 20:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbjDDAFf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Apr 2023 20:05:35 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2D93AB7
        for <linux-gpio@vger.kernel.org>; Mon,  3 Apr 2023 17:05:33 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id x15so28827882pjk.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Apr 2023 17:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680566733;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=M8biJ1aBbukeLfwN+w/+0iRNiLUjgXR0WEnlqTCaXvw=;
        b=cJ8T/bJ/DOKAf5nPWS/rWDTVm5GpHso3ZRrEV+vv/Y9tK1iJ1LvxG/PjhLoWc2X7v0
         xfAPyqZiCwKAbYX0+uehzDGsNpUcQ6rg1OoGarzIZlCwpeY5w9m2WdijxQ7izEpECs4M
         TAXm+/kJS5p1rWZPMcIKgC6G8GsyGTQuf1eeN42nzoTeo4qlwHaYExuqTohl+5AeWpp3
         mA5+2sEw9ojFwihpo5wYxtr7G6YPDyweOcVKSWCjRx1AG8oXLPg3+7f3Vowy+0ND0dZj
         QvDtcQu8r7V7irKHgcvR7wVNDghGRfzHu9PHGXcdX8o7ky+hObMDXdkvKI4ai1ST/csE
         y4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680566733;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M8biJ1aBbukeLfwN+w/+0iRNiLUjgXR0WEnlqTCaXvw=;
        b=t4dtJOBUM+Hdl0VLhi/VZZJGHdg2lXyxlCYTAn+fTXW4Unz+iDEKZURETptAUFiU81
         53YGrDHZpvW+ONL+cpbPAw1QJapY1gFN5IitDVRVDbyX0EvJuo7Kfil5eE1ImuNLBNKr
         vwxMtNFdvj6q+qoWV0tfNEBDw6zLOxFpb2NP5fkC2zP3QEBL+tmVBbnXArqK8fOV0ehK
         24+H48OR/95F3MXF4iJg229mrwlZd5VWFiBIJCH036UPk9eISdT+h7qwGFfr/Vc8b7Nh
         jtLrGlLAvWNff/5vze0jw0EcUe4pYQa+vjlmSyoCf8BhHghctTSvC0TUaNXKHF1PnMye
         Tcrg==
X-Gm-Message-State: AAQBX9eWTnwPxnQk9RCfVgrDYVdhgvpczRSPUa3EE9PLAK12924VshgJ
        a+KnZO6osP+qhkYe07+BitbobQ==
X-Google-Smtp-Source: AKy350a8EOWlE6/ey6qlDm4l3M/bElNRWs6BENfSo8Yhhz4VqjfFZVoicQqCKM9Tl+bt2b6qzQPHBw==
X-Received: by 2002:a17:902:f545:b0:1a1:a996:feb3 with SMTP id h5-20020a170902f54500b001a1a996feb3mr1094215plf.26.1680566733293;
        Mon, 03 Apr 2023 17:05:33 -0700 (PDT)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id y1-20020a170902864100b0019c61616f82sm7098625plt.230.2023.04.03.17.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 17:05:32 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Alexandre Mergnat <amergnat@baylibre.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Bernhard =?utf-8?Q?Rosenkr=C3=A4n?= =?utf-8?Q?zer?= 
        <bero@baylibre.com>, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Alexandre Bailon <abailon@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 00/11] Improve the MT8365 SoC and EVK board support
In-Reply-To: <CAFGrd9qLzcDJO_Fk_-B6XYuuxQzQoYLXmdp0Qj1Tszr0-sqNgw@mail.gmail.com>
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
 <7hy1ncydtc.fsf@baylibre.com>
 <CAFGrd9rKy9a4bUf1dkUtTogtWPFr5eu3jcsdaixi3hs_dWMwrg@mail.gmail.com>
 <CAFGrd9qLzcDJO_Fk_-B6XYuuxQzQoYLXmdp0Qj1Tszr0-sqNgw@mail.gmail.com>
Date:   Mon, 03 Apr 2023 17:05:32 -0700
Message-ID: <7h1ql0y0j7.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Alexandre Mergnat <amergnat@baylibre.com> writes:

> Here a build-able & working branch with dependencies:
> https://gitlab.baylibre.com/baylibre/mediatek/bsp/linux/-/commits/amergnat/i350-evk-board-support

This branch doesn't compile.

Kevin
