Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F11772DFB0
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jun 2023 12:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239026AbjFMKh3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jun 2023 06:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240051AbjFMKhW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2023 06:37:22 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF532E69
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 03:37:18 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5169f614977so9257298a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686652637; x=1689244637;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRltZ13hF+bVFkx8pWIO04hj1c0nJT3YI7pCs/V5dWE=;
        b=Btyf73jpPot7x1ooC1MyXxOB80xJLCja6hKLfLq1mvq10x5hXVqWZW+YGImRUXF6I2
         TGw5dnRDnx03OHOB6O6f3AgEIWyRR8cWJLdOThYpIBZNBpp/96xt6aQuyEWlW4B5XXAc
         d9i437BK7JJ/Pc2T9AwTtfNo7ur0Ml3UP2BbzF+iv877bkQuYgRtQX8TjWZoLFFrvceT
         2/3XJfZ5gHeYuc1y0SGEW6vv/3nNSNVQf3aCz7NpdzQnUmYJ65E/OGNpw18rwm4pDy2R
         /dTptX4YJEjcucgjaqEcNq0kXc5YWufoQrMYa6xa3KWPo/PNbI5SiF4BjNLtBkv91El6
         AA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686652637; x=1689244637;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hRltZ13hF+bVFkx8pWIO04hj1c0nJT3YI7pCs/V5dWE=;
        b=jrCIamzbH3tehfLpQEjFb6xV3/B0ItiMzWEdykFYJIhr2bTII8YjuZDZDQgPu+Dl3W
         cH0mBNlcSt+vPWwscoOsKNYzQEf3p5gdVFBKC2CIGcrEbKwWGmlGPT1ih6p8lnLJ0we4
         gBHdEHaYXXI8iolRvaKxg7LxbDAUyZO6pY3xBeqSE9Fnx7jcdq3AP8kMRRuIIobYSP/B
         P9tumk4fJ/P+NlBFcW9h4HTcSoSNOs6IqeGVMBbekj6FiY3S91BmVXZhP0XHg7fG/cNr
         JEul3e1dnUHoXZewAUHb0KeiugCeRrMl81j3y2XAS+inwTXbXeg0fOkgH8Jhin9hsCNB
         V1rA==
X-Gm-Message-State: AC+VfDx7W6+c8peGhG7zK6PNW5eFyEnVlNdQqDdVdmcC/dAJucIc0vXq
        nnnkHFuf3C0uKzZDOUyPpb9Iug==
X-Google-Smtp-Source: ACHHUZ6U45a73n+OGV6G9W9crrNQWge/8wPoaYa/Zy/wGK6eBJO6AtdmuW7Td4YwYCN6Qw72UrxQuA==
X-Received: by 2002:a17:906:730b:b0:973:bcf6:1d4 with SMTP id di11-20020a170906730b00b00973bcf601d4mr14503551ejc.76.1686652637109;
        Tue, 13 Jun 2023 03:37:17 -0700 (PDT)
Received: from localhost (i5C7407C8.versanet.de. [92.116.7.200])
        by smtp.gmail.com with ESMTPSA id u3-20020a17090617c300b009788dfde0b2sm6527709eje.12.2023.06.13.03.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 03:37:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 13 Jun 2023 12:37:15 +0200
Message-Id: <CTBGGK7MGILI.WKKN1OSEU35C@fedora>
Subject: Re: [PATCH libgpiod 0/3] bindings: rust: prepare for crates.io
 publish
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Kent Gibson" <warthog618@gmail.com>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.14.0
References: <20230612-crates_io_publish-v1-0-70988ee9a655@linaro.org>
 <CAMRc=MfNpirS8SEFDQsweTbOwNWG+-2XPz77kATzCSq_QN-fAw@mail.gmail.com>
In-Reply-To: <CAMRc=MfNpirS8SEFDQsweTbOwNWG+-2XPz77kATzCSq_QN-fAw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue Jun 13, 2023 at 10:16 AM CEST, Bartosz Golaszewski wrote:
> Series applied, thanks!

Thanks! Package is published to https://crates.io/crates/libgpiod now.
I will look into adding a README.md and explore whether there is an easy
option for getting the docs published (docs.rs does not work nicely with
us depending on a fairly recent libgpiod C lib).

Any suggestions are welcome!

- Erik
