Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02E07710336
	for <lists+linux-gpio@lfdr.de>; Thu, 25 May 2023 05:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238026AbjEYDJ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 23:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjEYDJ6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 23:09:58 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45B3CA9
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 20:09:57 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1ae452c2777so3996275ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 20:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684984197; x=1687576197;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6VBxa9VXdZ/wJeHjNtU5vKbO+AGaRJNgDDgmpeETfoU=;
        b=o+wSkDHbH/eqPOvL9ip2XzzdOWkzmMcE9vTJOOX0U/fM1BPwNXBrtnDo8OymPFhpXR
         pYfmWhgFNdHKe2CW8VXT5M483emwSyBGqp5fLcVRzF6GPYY46XXnek07fAkN9KsELgoh
         C9TpdE3fc/X3Wrzsuk3Ohq3h6dRTirQEJws5LR9o8zxSrWl0/6VdSdBkDMfFVCtT+2p6
         ZgFPZ6zFwfLr51+s5lPB49yJ2sm7Nu0xN94e9roRRKIO/zOMoF6XWYexHv9N4xghUHeN
         8tXHKjC5syXwRXUk+ohVjRNYX4wqnWgpFeFo3V0pptrnxkTCSShAs4J9wNgh/6symsdD
         oK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684984197; x=1687576197;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6VBxa9VXdZ/wJeHjNtU5vKbO+AGaRJNgDDgmpeETfoU=;
        b=cURJ5Lz5KUn/KGpZmKdS2cPnScWSnlPKhc3NlswnIUylvCxXgj9ZcrfVMUH3XYKdpw
         3Li+9n0VYmrq8egimzf936k1cO/EFVoib/LnOGprYX0HKTd7PJktq3Qlc+ihaUwGI/Ku
         pBkI0yJ6cLuPilUB3y3ivKddGj31yYP828KQARGF1oEfC5twjvYFlT7A2NjHIb2CH7GO
         G4e2jL7haDblOy3UHkEa5j/WwWFj/LSMVAXuC4bPBCCrJz7rKSpDTu57Wul1feHY26uw
         W7wsXUOb+aWCnhPLnupSy+1jEpfInS6TfYTTC4Y9OnoulOFH/e/4mGW3zZ/AGtmc+bL3
         RzPA==
X-Gm-Message-State: AC+VfDxK490WYnRXuuIZIj22iVklqdjRtfnO3b6ciR8NUpxG3ek9R0tE
        2jWXM+Dcv1CUs83aJsf5yGMmUc1LY+E=
X-Google-Smtp-Source: ACHHUZ4VIQc6aR4heOj/uhVA0ZAzTLDZtb7SxA3yynBlJSSAIowGC7tah7FCNqvnv3dgy+fcBRVl7g==
X-Received: by 2002:a17:902:db0a:b0:1a2:a904:c42e with SMTP id m10-20020a170902db0a00b001a2a904c42emr94069plx.24.1684984196701;
        Wed, 24 May 2023 20:09:56 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id u2-20020a170902e5c200b001a9bcedd598sm200506plf.11.2023.05.24.20.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 20:09:56 -0700 (PDT)
Date:   Thu, 25 May 2023 11:09:52 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     brgl@bgdev.pl
Cc:     linux-gpio@vger.kernel.org
Subject: [BUG] gpiolib: cdev: can't read RELEASED event for last line
Message-ID: <ZG7RgGasxXz4/pwl@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bart,

In testing I'm finding that I can't read the RELEASED event from the
chip fd when the last line on the chip is released.
The chip fd becomes readable, but when I try to read it I get ENODEV.

I suspect this change is the likely culprit:

533aae7c94db gpiolib: cdev: fix NULL-pointer dereferences

@@ -2425,6 +2449,9 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
        int ret;
        size_t event_size;

+       if (!cdev->gdev->chip)
+               return -ENODEV;
+

though I haven't bisected it yet to be sure.

Btw, that is testing on 6.4.0-rc3 mainline.

Cheers,
Kent.
