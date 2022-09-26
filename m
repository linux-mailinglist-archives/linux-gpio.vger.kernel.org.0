Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD3A5E9D08
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 11:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234117AbiIZJLo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 05:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234628AbiIZJLn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 05:11:43 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B325D3AB06
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 02:11:42 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id r133-20020a1c448b000000b003b494ffc00bso7093249wma.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 02:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date;
        bh=EThfXOsChd8Ds/teM8XF9/4bZFxtFbmMMLDhrhk/LVg=;
        b=YZ5eoYIuIJ6p1I7Tp7lJ7DfAZHCYo72xYKLIJT8KeobjK51yVBgeg9CPXFZxfy/hHA
         icOo7NbSG5b8+wC0ehDya+YuxiqQyBKcWTe0/ZIslatLP4Kx102K93kkDQQpWJ4igGC6
         MMBQbEREXE/gxkcmoOIjHrR7f5mQuG/VC6leGvntTKQ/LBJHGeMqEoIGTZ5vSxmlxVVQ
         hayzLTywgePCOE+jMr0A88DhvHWxxGYB5U+uZUxDth/C24YfLgttMN49jEUS5unEAJ01
         U2Fcs8jq6ivcbSAUtcthy9YeMotawg+cE3Go3+3JHo7FYcRvp/InaiYdCHiF2eFwbnfp
         XcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=EThfXOsChd8Ds/teM8XF9/4bZFxtFbmMMLDhrhk/LVg=;
        b=ZAcj/x36DhY3acNh8N/2hTw3B0iis5EzdO+VCVq//Rcrld4K+gvLVI2jqjnuuml6op
         sJj0c6NcAyZ7KTnwqkVUXDUjt5k75W4BLQxuHmWW5RcbKpWR3FP1d9pBhYKjG5xxO5i6
         Z7vgVdqIE6oVsIC6B7ob+Mz880JFC8FtxrKt9TNu03rPpJWaKX2yrsPMIhV8XR0yI3L4
         Ys7JIOOtTE80zovmBz2RRr08IIq/nm+6UUU4gUSc6/7/SGFPBPwgizlfSPjIm7FLKEGy
         DKrnl5GwvpK5xNnjbwLeNqaLghqaL8PKcTbVo3xQsrtATQDPX+q3zC9EaToPS/9Fyf9O
         nbew==
X-Gm-Message-State: ACrzQf1iVcfSdv/fPhc8ZyA2+fvnuIqcSztlmaxDXRvPfpvJ7CjehkTh
        ADqY0MitQ+2x6z/thquw+o7AiPVx5TdyAku6JYM=
X-Google-Smtp-Source: AMsMyM4V77tBYxJb30tY3LzVhPeiL5xuNiSJLOXuP6FLfeI98xrdmThBKae0zM3OVAhE8qI3YWTAM527YleNn3WuP70=
X-Received: by 2002:a05:600c:474a:b0:3b4:cb3f:2f5f with SMTP id
 w10-20020a05600c474a00b003b4cb3f2f5fmr21263219wmo.8.1664183501063; Mon, 26
 Sep 2022 02:11:41 -0700 (PDT)
MIME-Version: 1.0
Sender: amzzywisdom@gmail.com
Received: by 2002:a05:6020:a2d3:b0:213:d018:20e0 with HTTP; Mon, 26 Sep 2022
 02:11:40 -0700 (PDT)
From:   Ibrahim idewu <ibrahimidewu4@gmail.com>
Date:   Mon, 26 Sep 2022 10:11:40 +0100
X-Google-Sender-Auth: O9oqiFjND9XyUvu40GFqd04DRBw
Message-ID: <CAHmYgf4QQ-BNxsckhq951p7UF5_cqwoN=k=CPBxjKAM39k_vGQ@mail.gmail.com>
Subject: I Need Your Respond
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.4 required=5.0 tests=ADVANCE_FEE_5_NEW_FRM_MNY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FILL_THIS_FORM,FREEMAIL_FROM,HK_SCAM,LOTS_OF_MONEY,MONEY_FORM,
        MONEY_FRAUD_3,NA_DOLLARS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_FILL_THIS_FORM_LOAN,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

My name is Mr.Ibrahim Idewu, i work in the bank here in burkina faso.
I got your contact
from internet search i hope that you will not expose or betray this
trust and confident that am about to entrust in you for the benefit of
our both families.

I decovered an abandoned fund here in our bank belonging to a dead
businessman who lost hs life and entire family in a motor accident,
I am in need of your help as a foreigner to present you as the next of
kin and to transfer the
sum of $19.3 million U.S dollars (nineteen.three million U.S dollars) into your
account risk is completely %100 free.

send me the below details

Your Full Name.

Your Country.

Your Age.

Your Occupation.

Phone Number.

contact address

best regards
mr Ibrahim Idewu
