Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14D1317A852
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2020 15:57:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgCEO5x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Mar 2020 09:57:53 -0500
Received: from mail-il1-f178.google.com ([209.85.166.178]:43411 "EHLO
        mail-il1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbgCEO5x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Mar 2020 09:57:53 -0500
Received: by mail-il1-f178.google.com with SMTP id o18so5247140ilg.10
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2020 06:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=YlOA9vEslwH2hPd54pPwD1sTx4QicbpRPphUeas+ZKg=;
        b=l0/Weby8Fy+nAmFsvE14WFoehpAjQ1Oc97BpEdTK+Qv7nhRuhjBmJ3poz5l+/o2VaH
         zBy1CBHE5M/nr8czKqJaQWHgqsTEvYnXQVVsJwmRCyoY0PSn88ZzZ1hYM9vEpld6Zdq5
         fEHBUyt50iBD1TkHh+xSrPrAjsP9cLOLbyqzANXoUTM4cKmhTBuE8zWUWRjGkPm5grXn
         bHncjLkBglo1Om3l46Q0yna5W1cgY3WynIzRJowNAYwBAFS3Cg2eLoMC0Gro0U1/TC4e
         rICtYuieybtaQCF+upb84KY8dUVlM3jUXhU1Nvlun9fOd5snvV7QVKrMAq7je8nlIiGU
         RYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=YlOA9vEslwH2hPd54pPwD1sTx4QicbpRPphUeas+ZKg=;
        b=rz4bSWO3mT3V0XGLYHy4fEuO9wG6Du+W9Mx0NKDoHe5dGGph5U12+UCXEG61NAzY3s
         kwpZMroMG0KHJZ8N6vfw69FE2JjhndFmIwHROlJ9//a3nayo/2I21cTsPVtOzcrnEqtC
         9NQ/pHlPRenuwOxuWfvGoNKYxcgU27PugVRxuCzfjxIG+g3A0ZYKd5fg9MGKyi2yXpMk
         7BjJ+Q43PvUxEYJyNLo+sWFEFw28XlLxKzLPhJkkllUUDNWEoWV+5DmloK9t1cb4aFUi
         JNvZLmBfxNCryoDLkyG7qIujaXLlL8XGWBxIGrXB9Sg2d0JEeHhRVaO1kjEH3mHt7nRo
         6Lqg==
X-Gm-Message-State: ANhLgQ1tQn3f8/jyFdMsdqhvtDbuXfCrTvGC+04nKWLdcYQX8vXg5cRe
        y4iCuXpsfqBqIYssHcW3gYRYb2f2YeFggRq7V09WtSDev3k=
X-Google-Smtp-Source: ADFU+vs5roApPKawu7gFfs3FpklOgJVuP1jrmro4JWRHELZH0oNKxfdQVj//FFEB76iz7+vORniq7gm6DkSEy5y2p+Y=
X-Received: by 2002:a92:d702:: with SMTP id m2mr8043886iln.149.1583420271769;
 Thu, 05 Mar 2020 06:57:51 -0800 (PST)
MIME-Version: 1.0
From:   Mark Deneen <mdeneen@gmail.com>
Date:   Thu, 5 Mar 2020 09:57:40 -0500
Message-ID: <CAP6JJ88N28Tn+j=jonj8fVWmoVCLwK-4_6e-Vn8z+E7WDFHC=A@mail.gmail.com>
Subject: libgpiod gpiod_line_request output and keep existing value
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Is it possible to use gpiod_line_request to set a given line as an
output but retain the current state of the line?  I can not use
gpiod_line_get_value to query the state since the line in question has
not been requested yet.

Let's say that I have a userspace process which sets a gpio to high
and I restart the process.  I would like for the output to remain high
when I request the line again in the new process.  This was possible
with gpiolib+sysfs, is it possible with libgpiod?

Mark Deneen
