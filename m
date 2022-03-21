Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D768B4E2DE3
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Mar 2022 17:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234825AbiCUQ3e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Mar 2022 12:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351097AbiCUQ3d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Mar 2022 12:29:33 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40261615C
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 09:28:08 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id k10so4780894edj.2
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 09:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YBy3NtowO8eQ8uFYhD3I+GVQQGPzYBxs6im+gVazzd4=;
        b=i/z8dEX4CTAKVnuEwhZEgN9dS2X2KFh8htl7Sa2shr0FqjEcNqMpi2N39Pv80UPdIN
         FMo2ZMLUluzVn34zSWCfFJNi007KWNapA1u6sfbhRLS/ejS7D5CPeneBpQDbdP9Q2zNt
         vQNCGO+bPsNXlqM0qGLMx1qy2E+W6qCNIL92cjEX9XwiLgLMIiLVbxC/0eGvcANLYt9m
         nzbwQBCFPvtE3KhTycmRb6ZazU9P5PDYvY8ZysmcErUnzQnPhL1nqbqVW3zdGZ2UZ2nV
         DtxyFUQplHWwoKKrHtkqiXt+n80ceXguyrfQ3fP3SAUTLx7//Bb+DeCzE0BGn8GYM+QJ
         uCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YBy3NtowO8eQ8uFYhD3I+GVQQGPzYBxs6im+gVazzd4=;
        b=ECnCkkGqh87JvpivFCAID8AEnAbE5LoETSTDW5KlUF6HEqq6UsVqHO1GMODn6PzKt4
         cryO4hibhnlB6xjcLeyrD0YfQGSZ5KiXlE1TFDQErLTEa0TtNQAkaWzPRQrQvWr6Tc/J
         i412wY7dO1g4zU2fdP+9jYUsr06u8Ik0hqUM3WEPcUy2qW6lgq5ezFhBdyvJx01UcSV8
         ZwxYM+1vC/6bsPSFKNzAluCHQH9pLg5awIZ5+OxVjlh0hbSJqf1FNGlw3xwfHbsQeTbg
         fKDgWV2sJPCD+xeha9x1U/GMBewEY/WSfkV8LS8L1nwrLhcfZ7T/wFRPC7f3xto1pG99
         1Bjg==
X-Gm-Message-State: AOAM532iaDm3/QR0q3hwfHbCZtD4wVr8gIIaxsSu9CneLW4xY3e6UEVX
        tKOkEX/jk0JQGYblxvKpAjMXUlemBKVLN/M5AcO6z+mgcUs3QA==
X-Google-Smtp-Source: ABdhPJwV3xm0V40dDg9kjBtRyp0WWpWzNLZYW+J5lwg7Wns0smyLVS4f56ACgZnrNDkxEERQaUMnniMCJC3Rc83SDCQ=
X-Received: by 2002:aa7:dc4e:0:b0:419:407b:6bff with SMTP id
 g14-20020aa7dc4e000000b00419407b6bffmr5585446edu.158.1647880086620; Mon, 21
 Mar 2022 09:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <97da941f-39da-4ded-0138-d1e71c4d3ecc@gmail.com>
In-Reply-To: <97da941f-39da-4ded-0138-d1e71c4d3ecc@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 21 Mar 2022 18:26:56 +0200
Message-ID: <CAHp75VcXxSxtvEdHxenAWoP31WnkoyDJ6WfDwPDEKDhT3AtUmg@mail.gmail.com>
Subject: Re: gpiod: Set pullup for Input Line
To:     Hans Kurscheidt <lve0200@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 21, 2022 at 1:30 PM Hans Kurscheidt <lve0200@gmail.com> wrote:
>
> Despite deep searching, I cannot find any information, if gpiod allow
> specifying pull-ups to input lines and how to do/handle it.

Have you followed this code from libgpiod?
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/tools/gpioset.c#n44

-- 
With Best Regards,
Andy Shevchenko
