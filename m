Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABF8F737CFB
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jun 2023 10:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231636AbjFUHjW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jun 2023 03:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbjFUHjA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jun 2023 03:39:00 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7915D1718
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jun 2023 00:38:58 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-570114e1feaso63801007b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jun 2023 00:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687333137; x=1689925137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3NGFBQaaSMoHb7EhMmGmsuBiIuz4DhNFyHCYDGV/zA=;
        b=YxomoDjC5NarkVIOLm/FZqRakis1QIPTTw8kgxMAbOamfXzicpm+VK+AcaUuXzm3+E
         ukhsVM8ewzBE6vENyLxHqwl8sfvaFogE1YJ9CjNy1PuciGDzixk3Ar1vl0CRihqOilbi
         vLC6QPel4iYiXl19IE7pfFpKV8TDtaOB9F1AAEPzTON4JLe0ktLGczanwgXykv4M30iI
         q+5A3AGzaYlJpVSmcoaURB0ax6gpX7EDhSacUSK8VF1mkZrbaYi2vohvQq/HoOnnaeaa
         5+L/z7k9jrev3W3Nj3jHxcfrb6becdtjnOlXxqJufNyO6gTC1W/zNGiM1mb5ShSpeVAO
         m4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687333137; x=1689925137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3NGFBQaaSMoHb7EhMmGmsuBiIuz4DhNFyHCYDGV/zA=;
        b=cZW0BWkBC4jl3uWyVjIppfjtCrSpUhaWAWPAh3mdwtgfvLK0SN32mlnG/fLT6lWaHv
         QuM7+GnmIQZIj9BrZX6iBcR0MSZ9przJu0O6Ti7Hs4/p6UE0Wh0dBoZjX97OqaCLgPGN
         kGt8SyQkuSalDtgxcHOk5HRCMAMyXCyjD1EXq4/oXYQiAVKJd6xiMTOECs8rKqS6hdsn
         zZbNQBGws5meUwiBkpDzRgH+uYoOnA6Ba56c0GVYfVjTBVMe+e7JfiGXsGvwhU3EuAGg
         la9A+ulWnY4+VGo12Vk3nl8iGnKC334PYzNm1EtJu/3GVhxH8MN1kwNRfwjz0X2YH8Ei
         /MCw==
X-Gm-Message-State: AC+VfDzzB5GdsSZCLcx7G+R4fKfCzTSiPnz2UcySkCskFmYAqvXplyoL
        KhKRljAlxKUJAEbbXiCNFTDoq/npWd3H1NyAFrj/a1VMgOjbM6oi
X-Google-Smtp-Source: ACHHUZ4bnkFM4Wo5h+wGuc+axMlSdoHIxl2x/X7LbRKt6UqnaUmPpKlgDcKLsiKb2Uf9Hs7AayMYOJFdVKDnQTy5mOM=
X-Received: by 2002:a0d:df16:0:b0:56d:2d82:63dc with SMTP id
 i22-20020a0ddf16000000b0056d2d8263dcmr14410503ywe.10.1687333137648; Wed, 21
 Jun 2023 00:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <ZJGtpU3049d0bnfU@black.fi.intel.com>
In-Reply-To: <ZJGtpU3049d0bnfU@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 21 Jun 2023 09:38:46 +0200
Message-ID: <CACRpkdZec9rukp0VvfP1Tq9vTEzhx1MdWECRB+TFN_wOVOLwjQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.5-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 20, 2023 at 3:46=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Traditional PR for Intel pin control drivers for v6.5-rc1. This time not =
so
> big with the most important part that fixes use of OPEN DRAIN pin mode in
> a few drivers. That was in Linux Next for several weeks. Please pull.

Pulled in for v6.5, excellent work as always!

Yours,
Linus Walleij
