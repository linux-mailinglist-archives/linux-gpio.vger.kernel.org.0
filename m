Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0424C4CE996
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Mar 2022 07:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbiCFGvq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Mar 2022 01:51:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233032AbiCFGvo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Mar 2022 01:51:44 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B4F64C7BF
        for <linux-gpio@vger.kernel.org>; Sat,  5 Mar 2022 22:50:50 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id u7so16240775ljk.13
        for <linux-gpio@vger.kernel.org>; Sat, 05 Mar 2022 22:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=VaaSLAJ+hgNGNq49WyPsh3ndDLo+mnrYcswrOHpJSv8=;
        b=KDgAx1nMZI4VA0728iAuqALj69hyn7X0WLLUiz2m+OH09NDtWJqkn0K0IjhaqXccDL
         nYA9IS56U+BvEYDp5ZuYOTDJ28DkbGQXOo4nCoFRXwOq8btCUGBKve+nLdvXGAtQGfZd
         8/3HmQyIohZytZNIAaZ2YSJ+VGfF2cuAbX+92kqJIy7dPjcCYPV+qxcIVHj5OJkNioe8
         RnnPJV63I7FofbcYlKCR7cawwHR+Gyj/OksLFoNh7LOBENUnMHRRrWfgS+R5N0DbQgRd
         FM7OvtlHYW5haJ9bCovh/xFv8pj40s/F/HFWyLhlvxnDTkjGlvvz7xTkeBicCtgptiHh
         fIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=VaaSLAJ+hgNGNq49WyPsh3ndDLo+mnrYcswrOHpJSv8=;
        b=PZf0qfee7Miv/UtvU5WtmK97eN5jLXofWqIN6WeNlAhZtwF2aUbauQTkDjPx1Umfik
         8YP8fepof3fpgWU2HSjy/wUgJ+3oP+KTKUOexy2P/C8yYmvZ2gyQgbNoic0SChcwDlhf
         JYL1vIFvJNnfkF0QJ8o3BoX3nEp6tzPJhTvNNmQSTMzSKQHjddQAxtsZPDfWSYTgSjiw
         rTXqzut+6Weh/EbZMsmTzLgXeIHkr163W+LzXLmu16USdyIHYuyDYONAC9/cVCm25uf1
         n6nHghVneN+KD69VTjLCjclKu4bL2/JR3bCriTgbOdoO0vPpE+tC7Jf4msK1bCWjo7TY
         HjvQ==
X-Gm-Message-State: AOAM533y44eNKC4Ys0HVt/oG28F7GuSPP1RYeGenecfXVy8PrnPg7zjA
        +Q911oXxnEn2/HWkvf2hKC5ZwisClJmFTb0qEew=
X-Google-Smtp-Source: ABdhPJzq04i8VJyC6uwySEx5tzgrtxCg/XL0hqdBTWFWm66/zQAuy3m2ubrZV75jrYUP9jvmG0PdhfRUhLuebg8/B7w=
X-Received: by 2002:a2e:94c7:0:b0:247:de4e:e9bc with SMTP id
 r7-20020a2e94c7000000b00247de4ee9bcmr2397951ljh.397.1646549448778; Sat, 05
 Mar 2022 22:50:48 -0800 (PST)
MIME-Version: 1.0
Reply-To: mrs.susanelwoodhara17@gmail.com
Sender: mrs.arawyann@gmail.com
Received: by 2002:ab3:7d89:0:0:0:0:0 with HTTP; Sat, 5 Mar 2022 22:50:48 -0800 (PST)
From:   Mrs Susan Elwood Hara <mrs.susanelwoodhara17@gmail.com>
Date:   Sun, 6 Mar 2022 06:50:48 +0000
X-Google-Sender-Auth: NOWRSnt_sskMD3s295a30bcHvEs
Message-ID: <CACppo47TD9J4Sy+vaJu1wXHqd88WqFwMNn6OdkY1khwXu3TuFw@mail.gmail.com>
Subject: GOD BLESS YOU AS YOU REPLY URGENTLY
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GOD BLESS YOU AS YOU REPLY URGENTLY

 Hello Dear,
Greetings, I am contacting you regarding an important information i
have for you please reply to confirm your email address and for more
details Thanks
Regards
Mrs Susan Elwood Hara.
