Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69F19693F7F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Feb 2023 09:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbjBMIWl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Feb 2023 03:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbjBMIWj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Feb 2023 03:22:39 -0500
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B89F2126E0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2023 00:22:31 -0800 (PST)
Received: by mail-vk1-xa2f.google.com with SMTP id m65so872357vkh.10
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2023 00:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNFhsPbkfGfOWNF5M4aRb8nwKD8L5aVj2WV/H46NM8s=;
        b=FUl1PYoI6f7iaowuUwS7WQ+lm59mVLYdd9PxJxMH0hpKlctnYJr0OwwNREZKLvP2Am
         DwKWxu/0Jk+JGgsmeUlJTQd80TUHaP1Ys0k+RwJa6m5zdIgzFA7kMIvgujH6RcCPKYAL
         Y21pdWTp4KxdAuVRvn7mVLVq6kLVuS+ux1rKDDbBOtrWUDVv0qWjC0Lc/JPt6dSy8Zd6
         RhQRNOynaR9GbZ8sh75eYUzwu8EhC3eTnQvv1L0hGSGxPG5TTeN46PL99z5a7RsbBp9U
         NUKVX16/+l07eikPflUNp3ohRYvlmk7uYzYWKN6xMVq9OnSL3HRBzDRfAv5VTzZVw4l0
         xx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DNFhsPbkfGfOWNF5M4aRb8nwKD8L5aVj2WV/H46NM8s=;
        b=oDSkV584Ixktloj8ouqLmDSKnYOBx7Oe14kjZtZTW9P30I66PeZpxHGtyKiBjasWZb
         HJ6zFpiyY/QpCmM9H4EgrHlBEt6tBPptb1JIh7zVkjDO37hdk66MwsqyAkVknqQq9XQ8
         U0F7FJABKAmrIX0Y72BAA4J+MfWy9KZKtYJ82ZbNYPW4Jj5EV9z2RC7iEyfqHR8GXOPa
         rsv0eR7fvD8CPVsbrrLob6v904OGT0YSEYy+oxsKXQOqWGAZY1EbBT/OYH+bJDSIWdTl
         TAmcbONcOnyxqYS9Vbcct/0ASWqxjeyWK7OEMZLhlKr6IycXFS/WK5owGkwlARSM+AW3
         dHIQ==
X-Gm-Message-State: AO0yUKW2ZkGqIy6QQn0lLuUePt/tnkMfMMeB7gYhqH5jJVMAaXmcP4Zp
        a+ygP/inal7ao4so7nzF8E5fB4VHT9Dv8+qmIQ==
X-Google-Smtp-Source: AK7set+9UwkiFHdHvWwWhXVctY96ivbydUW+f3py/7uJ2afNQ6ep1a2hxq837+GFsQV5TqE4fgsKoS5daSneuGgcjrk=
X-Received: by 2002:a1f:2a06:0:b0:3ea:4830:a019 with SMTP id
 q6-20020a1f2a06000000b003ea4830a019mr3902464vkq.9.1676276550497; Mon, 13 Feb
 2023 00:22:30 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:d954:0:b0:399:647f:a8f5 with HTTP; Mon, 13 Feb 2023
 00:22:29 -0800 (PST)
Reply-To: engr.fred_martins@aol.com
From:   "Fred Martins." <fred49508@gmail.com>
Date:   Mon, 13 Feb 2023 00:22:29 -0800
Message-ID: <CAJFb9+A_oaVJb4x32SiDzSQe1=AMdB0dYt6R-AdvKbsbKJw7EA@mail.gmail.com>
Subject: Greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Greetings,

I wonder why you continue neglecting my emails. Please, acknowledge
the receipt of this message in reference to the subject above as I
intend to send to you the details of the mail. Sometimes, try to check
your spam box because most of these correspondences fall out sometimes
in SPAM folder.

Best regards,
