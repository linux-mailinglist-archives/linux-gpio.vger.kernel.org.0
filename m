Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33C7767E540
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 13:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233317AbjA0McQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 07:32:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233075AbjA0McN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 07:32:13 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845A97ECD
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 04:32:10 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-501c3a414acso64829237b3.7
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 04:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v0if3bG0az4VVrqjrBAgqmkkRSjBuWgCJhmn0kYqVUo=;
        b=FgWZXTUPi5P9XiCuBQQ7Mban5muT1PCuAYN+0cWoieKvqtgyl0BETa13RIeZruTQcI
         RMlnL/epMaeKzOQBweNCUpVbgYQafunJr0MAQW3/TvrzRwOexZQDDdWIlMiYv3B3TxCw
         JAaM3ihmcnwnT6voKtG6v0nmzCa5/Vs1uAlqRdqztT9iXBELBGQOHR+CyaOD+rjUb+pS
         r6JdwodKRM5lkPtF//UxlDd0AKiRSqjF37It476HLdauFoJe3GYrjo7GgUvsup2sPglI
         VwPK9Df8V36vQ6HzWHzRR1pRwIpcHi394E26eYHS02OgJpMJMT+PAQhk4Dh9ODBTHfHg
         y5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0if3bG0az4VVrqjrBAgqmkkRSjBuWgCJhmn0kYqVUo=;
        b=yQzl8jblPodNlG3SexBSQtrXBBSiWfYZzRZocwqHVAdaMuV90Kop2ZBwhtFfGcd2Qs
         4LksyqKC1hWS24Su8Aycfub8dTDU8g93rvFqPXBUhgIUPzIBxD2ScpBDmscIWRPR9rsy
         0MPqZzL4z4Qxf7vC3X0OFcZd8aIJEzADNTHXDfv81NRViGVCwdFuD3kSQYFSG5lDh+19
         eMWT2aownAkBmtH6JUxF2+ITlxHfmZmKjpatbkQvKPRHbb/Z1pXDUk91hNKEs9C7wpxs
         8ruG5JTd2N/5eL+/YXsAwQlB2SQSqjm14cOlurkyKxzVvuZRTRmU1feXRcClXFS/p6T5
         31DQ==
X-Gm-Message-State: AFqh2kpgUYHFJykHRWmW1sJPuS1K48Q5geyVrjqjja7QCgxFTzln94jy
        JTXLxYxIaz0xGyJxSrIxGIN7ltiMz7jOwC/mtrpvDA==
X-Google-Smtp-Source: AMrXdXuW9ov/7XYT2FJRuxqTfJG/eiPAHPczrgtkY00TYBLkmPlms6WH7OhqK/K+U7X67YZnbPfgRMOD/fB39Awpptc=
X-Received: by 2002:a05:690c:39b:b0:4f3:8d0e:edce with SMTP id
 bh27-20020a05690c039b00b004f38d0eedcemr3524525ywb.185.1674822729729; Fri, 27
 Jan 2023 04:32:09 -0800 (PST)
MIME-Version: 1.0
References: <20230120020536.3229300-1-robh@kernel.org>
In-Reply-To: <20230120020536.3229300-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Jan 2023 13:31:58 +0100
Message-ID: <CACRpkdYRmTiwdtghDjLpCwuQFzDEYhJiWStkwuphUUsAiOEwcw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mediatek: Fix child node name patterns
To:     Rob Herring <robh@kernel.org>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 20, 2023 at 3:05 AM Rob Herring <robh@kernel.org> wrote:

> The child node name patterns in Mediatek pinctrl bindings don't match
> reality. I don't know where '-[0-9]+$' came from, but I don't see any nodes
> with a matching pattern. Also, patterns such as 'pins' or 'mux' are
> ambiguous because any prefix or suffix is allowed. If that's desired, it
> should be explicit.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij
