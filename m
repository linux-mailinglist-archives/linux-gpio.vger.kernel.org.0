Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5C6F30BE17
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Feb 2021 13:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbhBBMVO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Feb 2021 07:21:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbhBBMVL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Feb 2021 07:21:11 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00F00C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  2 Feb 2021 04:20:30 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id p15so20169686wrq.8
        for <linux-gpio@vger.kernel.org>; Tue, 02 Feb 2021 04:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=qJmDXP0T0QBFomkJKbzYjLhMxrZ1Ffl75JL5NokD5fA=;
        b=s0olUwVUUQ63C7YJCDTGrXWu8M2SXIqTJBDD+nVEdeOq0JYAuO4QKLTf2YD60YJ+Nq
         8V97JiHoNDQLSDmS0KCPO7OsWChpqvp8/270e4VTtVF1BSg9Dngex4xUE9bSVieUhQz8
         DQJ4OMbQ0kfxjWo7/QWkkQrREk/zYbnA/6DJ9+BEJxvIhWOCpGhW4fLM5/GEx3ddUgf7
         6GX0mkYdBcSFN7Rs73Txsw7rD+QEOJekLFghLvgWVxQr8Bb+o2gPkYBe3yL8ImVAFuuC
         zLLZnb44n9St7OKMKB7QIjM1BSr3rJcT/9c6p5HeoubKxWhq+KPk2Qt2DNDXlO/pKO54
         /kpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=qJmDXP0T0QBFomkJKbzYjLhMxrZ1Ffl75JL5NokD5fA=;
        b=uVTWMUg5ezKWm6ooDDr+t4bM7gT3J7gA71ga8ArWpf+n82i/d5/P3DSEHPavS4HBFO
         S4Vt4KIxsf9uUnQKH7OFmQ9ranJD2Yo9IsIAzqjmOc03/hD+CgQhdtM8on0VVSlsUMGX
         kbu0XiG0IXTfn+qmTHPzEI4rFQzBSmxcOUlOkAUTAVgq2Id4SMbUlyizPGSBeNCsyCxw
         RZLyb0mm0bVhO4RqWLYpkKx9UPgwK5tFRYeGOSmIf1raVDEbiwRiLNpaxJO517EzeAbC
         UTSxL6cI5vCZUnn3KdrFG/tog9HYe66OPmoJpge5+SpmIKh9wpP2s6pSAQak5lClnYsA
         EBog==
X-Gm-Message-State: AOAM533peyEnVb0JGWcRlMTVCuYAhOO4IYbgqPQhmj/ZK7pY7hqJm3Dw
        eNvN/lE32/aJvfzWbg5GKtH8XXB9r3MopsM/YvE=
X-Google-Smtp-Source: ABdhPJwEWa7xOJVOKDvkThjIUkyjCNsjxFejpy5Gmxx48dKE5PY6BjWF7nLKvJHHo8yCsg/mOpxVMof7UFXYPvT2dVI=
X-Received: by 2002:adf:fc86:: with SMTP id g6mr23275421wrr.20.1612268429430;
 Tue, 02 Feb 2021 04:20:29 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a1c:6a14:0:0:0:0:0 with HTTP; Tue, 2 Feb 2021 04:20:29 -0800 (PST)
Reply-To: lionellawson52@gmail.com
From:   james cole <jamescole09037@gmail.com>
Date:   Tue, 2 Feb 2021 12:20:29 +0000
Message-ID: <CAEGZFQxHL092JO_y7jvnA-rfee7nMx-CZz+zVkHtc7VM8r+OKg@mail.gmail.com>
Subject: Guter Tag
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--=20
Irgendwann in der letzten Woche wurde Ihnen eine E-Mail gesendet
mit der Erwartung, eine E-Mail von Ihnen zu erhalten, aber
Zu meiner =C3=9Cberraschung machte er sich nie die M=C3=BChe zu antworten.
Antworten, um zu bekommen
Weitere Erkl=C3=A4rungen.

Hochachtungsvoll,
Lionel Lawson
