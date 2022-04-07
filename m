Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE4504F824A
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Apr 2022 16:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344360AbiDGO75 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Apr 2022 10:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbiDGO74 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Apr 2022 10:59:56 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 260011EF9C6
        for <linux-gpio@vger.kernel.org>; Thu,  7 Apr 2022 07:57:55 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id k23so11432801ejd.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 Apr 2022 07:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=u7Y/aNQfLOwE+LBFzRyrpOju2aGQFF727w+dXMJ2SrY=;
        b=Ip0dKJQiDzsTJAhtYnl6GKLlnZ2kukygCRHMumgjgX1VoT8+tBIQG3KltQkZyhPM4Y
         z+r8NpCaOLV+t5Mk2fFSixvFqNCbMgGPe5845TcB3EmUdT1BHv9Ho2tYXcWP6qUkf1c/
         o7+reyWn4O5jApV7Ki6BsTBmEC9G9Bv8CDXURui7XdHDbj804ffguikggHoJ80zG39cj
         1wFGsVuynltytVfO2Jkkfkef8NEGpP60M/wHx30161SHlSl0EwF55KqKy9IFwW4W+Jgf
         rrkmGXPdZplj14tkTGOHve9PEvJbEbkQ02Ff5Sx+1yFb2LPft2U6FPdO7qsKVDln5w+M
         M+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=u7Y/aNQfLOwE+LBFzRyrpOju2aGQFF727w+dXMJ2SrY=;
        b=g0tJPhsuHWCeJDpNvINDmO3+lnGHf81nmkVH+hB7Ss4e/SPTg6QMBfe9ZVgxy5jfL2
         pdjQLRL8ShFCP4USXW5TcfZ4OS1KUHMBlyzwTnYNjsfH9fzEdShq5ahvfldLC/4q60lA
         yqfSIGCmShxgEVlocurKim/Xw5XBl9nSEPbsCfBcfsIE21hkxe9auZB5i4x4oauH8JgL
         G/bsFsQmXVamf5UdCIYD/v3Kpc6KjTsfztH8xJgGbCjWJlhpSjplpsg05Uo3M/zaCwjh
         aMqHm+fUyIWDXi4rn+o0YmlLdnKCzBXAKD7OiLKMkeRGbkEAwuEyDK4i7GQ3/yEGIXKt
         b6+A==
X-Gm-Message-State: AOAM533n2teePp2E6VZgt52WZ4DzMmHdKlyMXNpKx/fImaZCpWqmuGGB
        2Ta97oSDYOELRL3m5ASo5fBqUQzvltOIsLx89TE=
X-Google-Smtp-Source: ABdhPJzbGYcNkGDxM8dSDGjgSrtbl6/VJS/Pti8dDBEPlPZDkd56KfQ2VO+5/UB2EoVeNo3ZusZN6x7umlOLiiL8m+g=
X-Received: by 2002:a17:907:97d4:b0:6e7:e45a:ad48 with SMTP id
 js20-20020a17090797d400b006e7e45aad48mr13939568ejc.23.1649343474499; Thu, 07
 Apr 2022 07:57:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:709a:0:0:0:0:0 with HTTP; Thu, 7 Apr 2022 07:57:53 -0700 (PDT)
Reply-To: jbi880375@gmail.com
From:   Julian Bikarm <julianbikarm44@gmail.com>
Date:   Thu, 7 Apr 2022 07:57:53 -0700
Message-ID: <CAHp73j8WzTAbmZEEz+T9zZ3wPeG_GxHWGg55r_xYzqqOLqm28w@mail.gmail.com>
Subject: Please can i have your attention
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:631 listed in]
        [list.dnswl.org]
        * -0.0 BAYES_40 BODY: Bayes spam probability is 20 to 40%
        *      [score: 0.2528]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [jbi880375[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [julianbikarm44[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [julianbikarm44[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear ,

Please can I have your attention and possibly help me for humanity's
sake please. I am writing this message with a heavy heart filled with
sorrows and sadness.

Please if you can respond, i have an issue that i will be most
grateful if you could help me deal with it please.

Julian
