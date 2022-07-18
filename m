Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43657578E02
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jul 2022 01:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236410AbiGRXDH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 19:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236405AbiGRXDG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 19:03:06 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2491A3335C
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 16:03:05 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id g1so17321005edb.12
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 16:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bCuV65AO3xjvo3XNNmdojm9svHgvfqPfeodDABzyyBE=;
        b=kR7aR1HQxR0fwFVRuD2V30Hz1vbP5xF+IUONHdVl381RaIypdmjANYgjwMwNYiztQo
         4Bk5NCbRdBF+b3CUsebO4F+F+dM5Ogbns93F7S84OlQqwbS2x56MN7yaXA13uVQ+ipPS
         WjW/LwKzIoxMhiiC6NdfjaZKn2joO9PQou/I8hH2WaYNEiTiBkkIpnncpJ8mNzmiPTp+
         qd5lybeDHjE+yHpVyko1068N4YIn4XR+OVCwVb34gI0sqNfxNhk8p3O9LvrVQXFiqOEq
         eL80KFu4EDWDdaoeGo8SOb8cuTtT4R7iKVwsGO2C3jcDEYWcBzmnr4yILZVV0HDwryby
         a+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bCuV65AO3xjvo3XNNmdojm9svHgvfqPfeodDABzyyBE=;
        b=YeSZ38wmRV1/aMVBKw/baQHCkuci+1fk2I7So7fyoCFMaoB7SlhUEzmQQxo/DPwC/W
         6e89lu5TTa/5dHqOn8DzYPsF7kfOF1xpdWiyAv1GI3jZ/xs1564eNDUBQZDl7yMLhzss
         JZHMRm40CExGJqgh7ABObBXFhDb0pTtF/2AoV+ywkx9lI0j0qr9mpryjhS8sWv6B2UuV
         Idu5IyfERI01Xx3tD1YpiMkN684E1KewRVxn6kFebTI0rWka6T6Zenp8r2L0jPfVW1Y3
         wcuyIvVRWEKRS16jreAN0eZFywobrSVO2AG8GL6CZpcfd6PcfYhKYX1EhlgftW4S1V0s
         h53w==
X-Gm-Message-State: AJIora9c/Ib/Xa9uDM7j9WQRu69SGVFULSCktnf6j/LXm2Y3Hls3iDck
        Ob6336OpMxfTg2kUv7I5gDzSaOgG9P2q0eOOBj8b352uS4ZVUQ==
X-Google-Smtp-Source: AGRyM1tcOjq2PV7D5Cf2k01aq9MpqaWCMGHYdZB9ytd/ZcVGEwSJYBapdwKkXVxQYPYI6yKi5fdOOCg/EWWc2tdPpqI=
X-Received: by 2002:a05:6402:371a:b0:43a:ece9:ab8e with SMTP id
 ek26-20020a056402371a00b0043aece9ab8emr39311986edb.126.1658185383730; Mon, 18
 Jul 2022 16:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657907849.git.william.gray@linaro.org>
In-Reply-To: <cover.1657907849.git.william.gray@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 19 Jul 2022 01:02:52 +0200
Message-ID: <CACRpkdbYriKi8QN-KrMN=teeqH=g2JwzB3qnCT1AaLcqTD=ssQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] gpio: Implement and utilize register structures
 for ISA drivers
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, John Hentges <jhentges@accesio.com>,
        Jay Dolan <jay.dolan@accesio.com>,
        Fred Eckert <Frede@cmslaser.com>,
        Paul Demetrotion <pdemetrotion@winsystems.com>,
        techsupport@winsystems.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 18, 2022 at 10:56 PM William Breathitt Gray
<william.gray@linaro.org> wrote:

> Changes in v3:

I'm happy with v3 from my POV, especially if also Andy's comments
are also addressed in the next iteration.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
