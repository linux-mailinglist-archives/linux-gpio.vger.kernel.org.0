Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B28757AFECC
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 10:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbjI0InN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 04:43:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjI0InM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 04:43:12 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E5995
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 01:43:11 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-59c268676a9so131435957b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 01:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695804191; x=1696408991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbZf2fFA2FQ5qrsMA6J+4jlQPmdMuMWJbNxXkcx0woQ=;
        b=ttxs85YMPPlc891Jam9KQgtHLayUWR9Y8PTt9jjRiyfrzIc3ou/w/TM2pwe3w+c6Zy
         BRfu3Qhap3uw/i7IISn6kNQoO54OXPyiouk248Dhb2zqRz3FzK6c4V6f+jiX22I/14ep
         os1MxLf9tYs2kbEwNIjiTD9gfSnvR5lP/xwPRL3+KuIAshXxqH95yJqKYoH2hJhPgCIx
         w6V+XoYbzGnw3hM5Do+NT8eOZV+wRO7lKHEHXv3GJyB3/bgm/PBtjO83XieBntqGBGgJ
         HwYUNxqL6XRLx+n60pRXrYk+qiVxlS+Md1t5U56Np5VzCZVIbyvxU+FjP3YmDgzNGi7+
         Dgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804191; x=1696408991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbZf2fFA2FQ5qrsMA6J+4jlQPmdMuMWJbNxXkcx0woQ=;
        b=jQekf8CaxomgYX+M/TGk9eUN/6Pm32zipqvev1HyY9D4o5b6uPg2OJy82Xx1Mbxzeb
         NS8uW94u4kco10ua9So6qBDnfZEH7vXXm8ADI+Zwl+6MLmLNOs/0LVpW8UX9E0wMMd7o
         LQKxbXcIQmc6VgIzPVTWL30rFug8LsiWZKO6Vgt6ntra+CI0oPmvGy1ktexuQTej11hV
         yl0jPaqmQg0yjYoDGRdz9qf9RyHzz+ehNU4wgFD3dza+vugPMgw8vO0Y4My3GdQCSNYe
         lYrcZtDCro2Qna/9tT5Yadf8CFxqe5xAJ3cX3YKidOepnsu598CNRF/qK5OAZcOHnYgg
         YKsQ==
X-Gm-Message-State: AOJu0YxAgptJhv7KKqhRfD4UBWjxSGUElZzblmYoGHq1px7lQ3+Ohz5l
        XyTT9Tbyreswh6uM2L1ZuBYMkJiN86W5VqlPMvYcwA==
X-Google-Smtp-Source: AGHT+IGARZ/ws1fRu2Yb4a4UQx44nHbRJFszxMdFAdC60oItaObm/kXlaW74QXdyzbXLViFp8x3ekZb9MDLlCcs2TJI=
X-Received: by 2002:a81:5d87:0:b0:59b:cff1:a8eb with SMTP id
 r129-20020a815d87000000b0059bcff1a8ebmr1698986ywb.34.1695804191087; Wed, 27
 Sep 2023 01:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230922-msm8226-i2c6-v2-0-3fb55c47a084@z3ntu.xyz>
In-Reply-To: <20230922-msm8226-i2c6-v2-0-3fb55c47a084@z3ntu.xyz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Sep 2023 10:43:00 +0200
Message-ID: <CACRpkdZHjsm8HLg9B1KYHnhstcjwd18r0bE5GF0_Z4EqcuAWWA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add blsp1_i2c6 and blsp1_uart2 to MSM8226 SoC
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 22, 2023 at 6:56=E2=80=AFPM Luca Weiss <luca@z3ntu.xyz> wrote:

> Add the I2C bus and UART interface found on the MSM8226. For the I2C bus
> we also first need to add the pinctrl function in the driver.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

v2 looks fine and ACKs in place, so patches applied!

Yours,
Linus Walleij
