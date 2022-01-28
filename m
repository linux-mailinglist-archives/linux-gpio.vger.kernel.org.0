Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32B1D49FB65
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jan 2022 15:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244838AbiA1OMZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jan 2022 09:12:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236686AbiA1OMY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jan 2022 09:12:24 -0500
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE96C061714
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jan 2022 06:12:24 -0800 (PST)
Received: by mail-qv1-xf30.google.com with SMTP id g11so5937912qvu.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jan 2022 06:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=9ktgcbuAPmPG0aPsx4VeS1P9IGXZF9a3lw5+oYdRqIU=;
        b=iDqCvXHLMhMxdK66vJrcxmsMi01kyfwrl6xHg6x9gSLm9ulsM6ZcK9wG06oj1g9l49
         +nYAw6UWCEWIzXIkUrwQCmGilLnfnIexJI0SFJJjwmvAezPknGZw0HAq0yWhO8h9EqS+
         HkjpzVNT9yWMs9L2RN9zAMdTxnlqnF3k440KLQp5kGUNuDM1U2h+dNJrWYlJVNhKlxnk
         LsIlDgFZh4RxBZ2bQUfD8gNc78Dse0kvgjLM50x9EBJy8BtakevGdLUwM8bu7vOFEZ+U
         kHAUlRvzJ7QkWf7k79scByyn+ySfjGk6CjqlORPc1sRpZSbXfcN66vyMVsO9CO7zzdGe
         pw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=9ktgcbuAPmPG0aPsx4VeS1P9IGXZF9a3lw5+oYdRqIU=;
        b=6HtDf0uUfcFw/btKK10Fg2Xi+jLdZ5wC26XlORpx+woxQgvBdIYhPDC4Lr6azyP1kA
         ldUNEg2k/U/56EDCCxoszbf3xVwzwRiiOhlNZMG8wiei2W5a5LqTI88VoaHKjDdO+9LL
         Q4YSA6XRmxIgeuJROu7IGRMM40tqPsCPRaEot7/F1xRN8+Z+vNXjXDMBFXyTqunarIiA
         LOjPo6EyMDJtaH8rBKcUcqgtnoSg4P1u8R+HGuCi8lkQ0FDMrChnbwwOF44X/GMascXA
         Pg2VRrdB3PNbXJIN/LJeq1Zjto6ZXtlnDPjdJQLXoPOharUypiRi3VP5w57Yaldikj7L
         WQuA==
X-Gm-Message-State: AOAM533Ehw60XWk3ICFHCBcblWePrF59FtMwD33wTE5/oL58FauV5IyK
        Om8JoTvP/Fq73BTr5t4dtPtSlyFkpdNTfwEqZrm6C7b1WF+NUA==
X-Google-Smtp-Source: ABdhPJyxDA0V2TG1sD4+27LSDtpbnpKbsuDlIIt5xfHL1W8dj2iqOd2KH0sh8bjvltDY5k+VqLI3Zx1TVEd5ABg1V2g=
X-Received: by 2002:ad4:5962:: with SMTP id eq2mr7819266qvb.24.1643379143221;
 Fri, 28 Jan 2022 06:12:23 -0800 (PST)
MIME-Version: 1.0
From:   Gasai Maple <gasaimaple@gmail.com>
Date:   Fri, 28 Jan 2022 22:12:13 +0800
Message-ID: <CAA=7Zrk43M3Q_cRnRwoJyyBk-C-3ACqvLg6toMou6eobsua7Uw@mail.gmail.com>
Subject: A problem with gpios on my sunxi board.
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I posted a question on stackoverflow, it's basically about me having
problems operating gpio with libgpiod, and a user advised me to drop a
message, the link is here
https://stackoverflow.com/questions/70863283/libgpiod-tests-fails-on-pcduino3-nano
