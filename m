Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 673BA4D2D27
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Mar 2022 11:33:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbiCIKes (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Mar 2022 05:34:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbiCIKer (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2022 05:34:47 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 283B5CCC4D
        for <linux-gpio@vger.kernel.org>; Wed,  9 Mar 2022 02:33:49 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id h126so3423408ybc.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Mar 2022 02:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=yUeHSVDWsqahkAfWC6cZr5rUavhFyS+Y2cZPnJfoxIU=;
        b=F9DhYaMSmEUHHQUoK9ju94aAGV8wZ3edBpS1HVwB/w/vEaaRqj2b8VsYIk3npuVFnO
         jqJOppjaxR1DaSvaUUSBzFWEAjyUjVzV7Lw1tx27kj4Bl3dyyEeGVK4zuU9wEfltl5wW
         EBt6TYW1eD7iavqWTg3avMKm9DG2IGLHf8D6De3J+wp/LhCDBibb03VKiF9pns1cEnpV
         WzLqDtgHZWcY69Srape6gGvkU2OTKixtWc+troAcIIy9Nj7rbhz/8MBfBtGvSlDCh4GB
         ecs8fexEoL19dnUStgHkq8DJGQGDPB7wLgxjmX/sgOFwZEiHfprP2O+1hy3hXQJIcB3K
         +6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=yUeHSVDWsqahkAfWC6cZr5rUavhFyS+Y2cZPnJfoxIU=;
        b=fLtLs5TZzzkZ0N5A6JRFx92lucfZl8zjNrwXEs1hjZ+QzXlEI8HdlIl+OnajjR0Ir2
         Hc3IYV4wEXHZ7RiRxC+OiH/WmglM2bAGEGTubTnp5wFKTJ1PhRItlPTgBZ5c1D4vc/Zl
         vz87nYrQKrKe6CVK3voAn6dB691hY9EhC6Y8kilON0kKjyEglaLaac+U/mWWFv5mjWai
         yvgeWpn+qQkmK2sE5xpxqQOJMqghGg75dwZgHTzI3po2II7sNrqpN1TG7PAn+WIXWeSh
         yH32ij6T9puTSfUfvqmuHclqwH5CiLpYgXl/49TRQgfE30FJmABdq4mK6uOnePQNANWs
         51GA==
X-Gm-Message-State: AOAM5336nhqrVpLTKwYaKFA9t7nrQucvGFl5TYXWmBSawErWgjRolvdd
        VUP6bVaNPKw/N7fCp5XBBSnq+NKyt+SlVi8kIGc=
X-Google-Smtp-Source: ABdhPJwnATrlSCVJy7XrNygl2v2of3k8edfSBm0zgku0LDYytdZZyKAy6QZ27+lNSsnlFBrredotZ24VL8HgayST8D0=
X-Received: by 2002:a05:6902:4e3:b0:628:ab48:45a0 with SMTP id
 w3-20020a05690204e300b00628ab4845a0mr16069594ybs.535.1646822028399; Wed, 09
 Mar 2022 02:33:48 -0800 (PST)
MIME-Version: 1.0
Sender: kossiayalaesq@gmail.com
Received: by 2002:a05:7108:7006:0:0:0:0 with HTTP; Wed, 9 Mar 2022 02:33:48
 -0800 (PST)
From:   Folson Terfah <terfahfol@gmail.com>
Date:   Wed, 9 Mar 2022 10:33:48 +0000
X-Google-Sender-Auth: tgZV6C1pgI_2js3xVuJK-vKMiKM
Message-ID: <CA+B4aO=5Y9yjO-Z4UKkFJUhm=_+gk1trL7nFQzYaZnhYMcZGgA@mail.gmail.com>
Subject: Hallo
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hallo
Erhalten Sie meine vorherige E-Mail?
