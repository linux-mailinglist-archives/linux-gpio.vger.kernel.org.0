Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B61667EB7C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 17:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbjA0QtD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 11:49:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbjA0QtC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 11:49:02 -0500
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ADF17C70B
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 08:49:00 -0800 (PST)
Received: by mail-ua1-x943.google.com with SMTP id a40so1171928uad.12
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 08:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FoRX2f/YZd1ew3w9a7uXRMrccel34cHi9ReaKIRWJg=;
        b=aiWnRzkVJFZnk2SeywHSWb22ikdqPvxTuIUhzL0g+kpv2M60Wi03nnZx68VX4gNJRh
         aA2ckN6hp/Rhbi0DCzb5j10VANchzKNPXPA3ajQSVDAe81AgVYBuMqIeU3lNSlZ8bqS2
         ero4xwN3OHhHSv7jguT8zLOnDgdlNu1enPxmEOPauP0kiWl9lPnZ5175C1if+B8VNOxw
         PUgXSOoXvcRlaNGVdT5oD2EOwwtsnolNvvurDrEOhr2BMgcUgmNzlJfFqqguko806+gc
         27K/X5XC8qhykm8wcOOPlLrH/fnZJABmpvAO0zFNqkgP6t4gLbGUjfJaTHU57zybZjVb
         ia3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3FoRX2f/YZd1ew3w9a7uXRMrccel34cHi9ReaKIRWJg=;
        b=CHBxzSadq13wrl9IkyDxoTWWMpS00VaBQD5lvXtE2jpBr6MFROgO8/9ZCSnQxDn+u8
         x1PoWbCszGwrlGp9exxfrxewExKTkVNmFzM9MKqT5zCBetL+F+y3i7GeRbAWpTiNv66E
         nQatqDC0V7L+ZDtthU/6iKN3b9mj6KD6bl6sl8J22BWBYYTZARADbGVRgvz9AvAPU0A8
         JlWq8wVY2bxAf6fjMYbKsJtOCZeBa55wxBz7Kic/KBwkOeudI+tvGeids1xfR1iGP1Fp
         14MIX3ATkYaS4SBZfjo74Wn9XSYJ4lNMwD4MA8Zmu4xmhZJD+GrTafxDKbTftG//hC/d
         MN6Q==
X-Gm-Message-State: AFqh2krNBdO2+naMIYzexhrCnq46JaOqybbv5+qOaoevh17eKYWT8695
        f1f5IwTqdyikotZyXHRt6B4yBSDrlbZky2tM90E=
X-Google-Smtp-Source: AMrXdXvWlBR2JQUgJhOKz96hIFokgVI38HHow5H2id60v4PpbDzQN3mibeZh9naVJq4IrnKMx8n1EGvH9MabnYjWL6w=
X-Received: by 2002:ab0:238d:0:b0:419:c78:2e5d with SMTP id
 b13-20020ab0238d000000b004190c782e5dmr4605395uan.68.1674838139473; Fri, 27
 Jan 2023 08:48:59 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab0:7401:0:0:0:0:0 with HTTP; Fri, 27 Jan 2023 08:48:58
 -0800 (PST)
Reply-To: lassounadage5@gmail.com
From:   MS NADAGE LASSOU <lnadage50@gmail.com>
Date:   Fri, 27 Jan 2023 17:48:58 +0100
Message-ID: <CAK90KWQ4-G3-d4hGk4RPh6THNWjD+H4G6YV3iWPOiUuhdroy+w@mail.gmail.com>
Subject: YOUR URGENT ATTENTION
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:943 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [lnadage50[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [lassounadage5[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [lnadage50[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Greetings.

I am Ms Nadage lassou,I have a business for our benefit.
Thanks, i will send you the details once i hear from you.
Regards.
Ms Nadage Lassou
