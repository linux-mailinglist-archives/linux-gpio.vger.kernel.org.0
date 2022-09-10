Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60B2B5B4A4D
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Sep 2022 23:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbiIJVgM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Sep 2022 17:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbiIJVfb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Sep 2022 17:35:31 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD8E82C13F
        for <linux-gpio@vger.kernel.org>; Sat, 10 Sep 2022 14:30:02 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id a67so7527161ybb.3
        for <linux-gpio@vger.kernel.org>; Sat, 10 Sep 2022 14:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=M0Dgjuc/8dCo38EDtGb4SvoyhN+jAjWvrCQyk6kWky8=;
        b=tXjWQ4nFjwCYira/xYuRwVxHDtXy6T7kxZbkJ4b4NFTR/KDiECLRpH6mzQAgZK6dEG
         qwnFc6mr4kkePNCmNIQhhU6+oUcYlSSFTo7iTJp/QYfqtb6I3IIejfWJMOncQswFcXgP
         eeSh1TOdrZb0Tlf/fW6V7HtKsfBEkbteBfarKrynTQc1A86UUt1/n79RSEk2/oB/bhbP
         tZmW4bqzgi62O4BcSHVnH0kirqoKcu0bj/dGf/a8OJ5sce95yOMEyCJno7kYINCVOous
         vL1vkhTfiuXXXvDzEZhzoHHbUi5GzVLrr3JEGU/aUkx55u+XeKQBRNw5gurGNbVtC/eA
         U7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=M0Dgjuc/8dCo38EDtGb4SvoyhN+jAjWvrCQyk6kWky8=;
        b=cHH05sQKyetu5VifqPN89opvpQRXqxLZGh7Gs3ZJ7dB/DAYTh1oPPEKT74aL42DxSC
         KEzoacqvlxCEpELbI8IcRSuxbWMUXkqahUgJtsMAGYe4qaKMFVYLcnLmYUEjh31+K6Ee
         ZyC//MdhRlJMfREVpnYHzBMiSvvmyNtvrIsOkhnzowJraeVktczuqjsNItRDBfb9C2cm
         Oet0yV4lVRAmme7x03eWsH0PM8zcfdSRvNErPTAafbvSIDhrBjSDn3+aHyeNbYqNBQyr
         SMdZmR76TXPeUkgPfOWqf5s1hn6hFQroEoNd4LhikhT0o4beatlvcc69kdyYQe8RIxzM
         sLPA==
X-Gm-Message-State: ACgBeo3wwJA4EwhKrCIRrR5Y+r12ek0X0usLbzi6pJVskv4TpXrG3079
        /FEx0NCLU90ATbt8OSAyLH+KJjt1H2Tz0riBRDEwkkbt/3s2hEni
X-Google-Smtp-Source: AA6agR40HpWOP8pfJ620MFoHWcDFVC7yNXjW9cZ6miHM/pzbbPc/as+0TF/4cQV2upAcWI2KSPlDvqYBBK/DxXzkoHQ=
X-Received: by 2002:a25:c907:0:b0:69f:cba0:72b1 with SMTP id
 z7-20020a25c907000000b0069fcba072b1mr17087521ybf.518.1662845322177; Sat, 10
 Sep 2022 14:28:42 -0700 (PDT)
MIME-Version: 1.0
From:   Drew Fustini <dfustini@baylibre.com>
Date:   Sat, 10 Sep 2022 23:30:05 +0200
Message-ID: <CAFTh7p2P+3_4Bj6nhrzvaYJGd6rny8SNyK1gbX9S3XO798zTFg@mail.gmail.com>
Subject: Linux Plumbers Conf: gpio and pinctrl session this Monday
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello, there will be a "Birds of a Feather" (BoF) discussion session
for gpio and pinctrl at Linux Plumbers Conference [1] on Monday,
September 12th, at 10:00 Dublin time (9:00 UTC).  It is a hybrid
conference with a virtual registration option for those not in Dublin
[2].

Both Bartosz and Linus will be attending the session.  I hope that
others on this list who are interested will be able to attend as well.

(Sorry for the late notice - unfortunately the schedule was not ready
until a few days ago).

Thank you,
Drew

[1] https://lpc.events/event/16/contributions/1302/
[2] https://lpc.events/event/16/page/181-attend
