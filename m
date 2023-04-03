Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1FC6D3F9D
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Apr 2023 11:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231686AbjDCJBC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Apr 2023 05:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbjDCJBC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Apr 2023 05:01:02 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B69E5B97
        for <linux-gpio@vger.kernel.org>; Mon,  3 Apr 2023 02:01:01 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-54606036bb3so373096147b3.6
        for <linux-gpio@vger.kernel.org>; Mon, 03 Apr 2023 02:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680512460;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vE40mJuVkISt0zg8IVAmmNvtPq9ArtEbvKSLEgCOttk=;
        b=RRZUrhKe2XBl2Pj8ueAvJh8PV1GMqZ2jivHtbkZZ+nZSzffZbvJmCEe7wQ+cP1hQlf
         Bp0yTcPS3LY9FYVzqHxe34kux+JqBTnPCIIha8Snb9P33UdQdrxoHUaI9yYBD+u/WqtG
         B8XgGJvvPC8wxmmVXSyXZ7vMCrSPqSOq8aBd6RLf7DQhsOeGlvv++PNwJpWfRzXRcVq3
         9/FSpcy/uNWzRR8WNmptLyXjS5XZSbpiS8UphnMpNZ6Ku3R6JBZnNPiY8I+kUmM2YqlY
         j9jrQVNvrraK+D+V820rukmn9u2AZqJbENC28kNHjsNLbc67BixJf7N/c/Ff4FGh2hV3
         J6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680512460;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vE40mJuVkISt0zg8IVAmmNvtPq9ArtEbvKSLEgCOttk=;
        b=6+mZimlr5j+lNgWDm9aLsm3wF9IUeakrIM2dNywirmlFbnhG1St5TEJdtx/bxBNdBf
         FI4uhIITt4kwumgMyoY6TlhyRk4mNrEc376jOU2NATgNnMM6GdsARGxo2k3pT4rJPM00
         IQ+/ZA/9N+1zZxsXcr72LTgCDEWaqKugQs/ibmVsFbEDJrR8hUy9nPjuwvqPDsnKOnYG
         4hTqfiYl5wtkOBUlDTUyRY+pKLEwJDh/ROi9IpbA1D4VG0Cpl47K8m91rHrNM7q79e4U
         XpvqWP9q8EHdNtEJKEKnQUxJyD/3APtGGr1z3IL/m5bXlIq9jS48XoC5e0xciDbODHCS
         o80w==
X-Gm-Message-State: AAQBX9c+uVDWbCj9eHYtsX95aAh2ryU8jUybEQ+A8AaRdz+I3DNgU8qA
        /1juVMccj3RZ1/nkQonduLYV0AEm7FzZLLf+1z4=
X-Google-Smtp-Source: AKy350YqpB3a10ouA3+HpBQ+EOeh893X24XGlck4kdF3ooiTrwlbf3SeYdotw4xbIozQjyArKwr2NvUOfRdoKTVKGho=
X-Received: by 2002:a81:b50f:0:b0:544:b8d8:339e with SMTP id
 t15-20020a81b50f000000b00544b8d8339emr17889731ywh.5.1680512458964; Mon, 03
 Apr 2023 02:00:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7108:298d:b0:2f2:4123:1c5 with HTTP; Mon, 3 Apr 2023
 02:00:58 -0700 (PDT)
Reply-To: lassounadage563@gmail.com
From:   Ms Nadage Lassou <lassounadaga0@gmail.com>
Date:   Mon, 3 Apr 2023 10:00:58 +0100
Message-ID: <CAJywv4mwPxqyBR-4WfK5Ea6WbFod+hD9+9FGEkE+7nHgbVzTig@mail.gmail.com>
Subject: PLEASE REPLY BACK URGENT
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Greetings.

I am Ms Nadage Lassou,I have something important to discuss with you.
i will send you the details once i hear from you.
Thanks,
Ms Nadage Lassou
